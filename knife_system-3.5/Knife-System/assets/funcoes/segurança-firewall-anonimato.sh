
# Área destinada a usuários avançados que possuam conhecimentos para modificar
# esse pequeno firewall de acordo com suas necessidades

function seguranca() {

function firewall() {
 iniciar-firewall() {
   clear
   echo -e "${verm} ATENÇÃO!${NORMAL}"
   echo ""
   sleep 1
   echo -e ${amarelo}"Ele pode não funcionar em algumas máquinas"
   echo -e ${amarelo}"dependendo muito dos serviços que nela roda"
   echo ""
   echo -e ${branco}"Edite-o de acordo com suas necessidades${NORMAL}"
   echo -e "${branco}Caso tenha alguns serviços que o firewall bloqueia${NORMAL}"
   echo -e "${branco}basta apenas descomentar a linha com o nome do serviço no firewall${NORMAL}"
   sleep 10
   echo ""
   echo -e "${ciano}Iniciando firewall...${NORMAL}"
   sleep 1
   clear
   iptables -F INPUT
   iptables -F OUTPUT
   iptables -F FORWARD
   iptables -F -t filter
   iptables -F POSTROUTING -t nat
   iptables -F PREROUTING -t nat
   iptables -F OUTPUT -t nat
   iptables -F -t nat
   iptables -t nat -F
   iptables -t mangle -F
   iptables -X
   iptables -Z
   iptables -t nat -Z
   iptables -t mangle -Z
   iptables -P INPUT ACCEPT
   iptables -P OUTPUT ACCEPT
   iptables -P FORWARD ACCEPT
   iptables -P INPUT DROP
   iptables -P FORWARD DROP
   iptables -P OUTPUT DROP
   iptables -A INPUT -i lo -d 127.0.0.1 -j ACCEPT
   iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
   iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
   i=/proc/sys/net/ipv4
   echo "0" > /proc/sys/net/ipv4/ip_forward
   echo "1" > $i/tcp_syncookies
   echo "1" > $i/icmp_echo_ignore_broadcasts
   echo "1" > $i/icmp_ignore_bogus_error_response
   echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
   echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
   echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
   echo 1 > /proc/sys/net/ipv4/tcp_syncookies
   echo 1 > /proc/sys/net/ipv4/conf/default/rp_filters
   for i in /proc/sys/net/ipv4/conf/*; do
   echo "0" > $i/accept_redirects
   echo "0" > $i/accept_source_route
   echo "1" > $i/log_martians
   echo "1" > $i/rp_filter
   done
   iptables -I INPUT 1 -m state --state INVALID -j LOG --log-level info --log-prefix "PKT INVALIDO - "
   iptables -I INPUT 2 -m state --state INVALID -j DROP
   iptables -A INPUT -m state --state INVALID -j DROP # Elimina os pacotes invalidos
   iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
   iptables -A FORWARD -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT
   iptables -A OUTPUT -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT
   iptables -A INPUT -i lo -j ACCEPT
   iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
   iptables -A INPUT -p tcp --dport 80 -j ACCEPT
   iptables -t filter -N syn-chain
   iptables -t filter -A syn-chain -p tcp --syn -m limit --limit 2/s -j ACCEPT
   iptables -t filter -A syn-chain -j DROP
   iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 5/m -j ACCEPT
   iptables -A FORWARD -m unclean -j DROP

   ##Proteção contra Spoof
   echo "nospoof on" >> /etc/host.conf
   echo "spoofalert on" >> /etc/host.conf

    echo ""
    echo -e "${verde}Firewall ativado com sucesso.${NORMAL}"
    sleep 1
}
 function parar-firewall() {
     clear
     echo -e "${verm} Parando firewall..."
     sleep 2
     iptables -F
     iptables -X
     iptables -t mangle -F
     iptables -P INPUT   ACCEPT
     iptables -P OUTPUT  ACCEPT
     iptables -P FORWARD ACCEPT
     echo "1" > /proc/sys/net/ipv4/ip_forward
     echo "0" > $i/tcp_syncookies
     echo "0" > $i/icmp_echo_ignore_broadcasts
     echo "0" > $i/icmp_ignore_bogus_error_response
     echo 1 > /proc/sys/net/ipv4/conf/all/accept_source_route
     echo 1 > /proc/sys/net/ipv4/conf/all/accept_redirects
     echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
     echo 0 > /proc/sys/net/ipv4/tcp_syncookies
     echo 0 > /proc/sys/net/ipv4/conf/default/rp_filter
     for i in /proc/sys/net/ipv4/conf/*; do
     echo "1" > $i/accept_redirects
     echo "1" > $i/accept_source_route
     echo "0" > $i/log_martians
     echo "0" > $i/rp_filter
     done

     #Função abaixo remove as linhas de spoof do arquivo /etc/host.conf
     linhasTotal=`cat /etc/host.conf | wc -l`
     linhasRemovidas=`$((linhasTotal-2))`
     sed "$linhasRemovidas, $linhasTotal\d" /etc/host.conf
  }

function iniciar-firewall-permanente() {
 reset
 echo -e "${verde}Esse firewall será 'ativado' toda vez que o sistema for inicializado${NORMAL}"
 sleep 3
 echo  ""
 echo "
 iptables -F INPUT
 iptables -F OUTPUT
 iptables -F FORWARD
 iptables -F -t filter
 iptables -F POSTROUTING -t nat
 iptables -F PREROUTING -t nat
 iptables -F OUTPUT -t nat
 iptables -F -t nat
 iptables -t nat -F
 iptables -t mangle -F
 iptables -X
 iptables -Z
 iptables -t nat -Z
 iptables -t mangle -Z
 iptables -P INPUT ACCEPT
 iptables -P OUTPUT ACCEPT
 iptables -P FORWARD ACCEPT
 iptables -P INPUT DROP
 iptables -P FORWARD DROP
 iptables -P OUTPUT DROP
 iptables -A INPUT -i lo -d 127.0.0.1 -j ACCEPT
 iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
 iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
 i=/proc/sys/net/ipv4
 echo "0" > /proc/sys/net/ipv4/ip_forward
 echo "1" > $i/tcp_syncookies
 echo "1" > $i/icmp_echo_ignore_broadcasts
 echo "1" > $i/icmp_ignore_bogus_error_response
 echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
 echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
 echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
 echo 1 > /proc/sys/net/ipv4/tcp_syncookies
 echo 1 > /proc/sys/net/ipv4/conf/default/rp_filters
 for i in /proc/sys/net/ipv4/conf/*; do
 echo "0" > $i/accept_redirects
 echo "0" > $i/accept_source_route
 echo "1" > $i/log_martians
 echo "1" > $i/rp_filter
 done
 iptables -I INPUT 1 -m state --state INVALID -j LOG --log-level info --log-prefix "PKT INVALIDO - "
 iptables -I INPUT 2 -m state --state INVALID -j DROP
 iptables -A INPUT -m state --state INVALID -j DROP # Elimina os pacotes invalidos
 iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
 iptables -A FORWARD -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT
 iptables -A OUTPUT -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT
 iptables -A INPUT -i lo -j ACCEPT
 iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
 iptables -A INPUT -p tcp --dport 80 -j ACCEPT
 iptables -t filter -N syn-chain
 iptables -t filter -A syn-chain -p tcp --syn -m limit --limit 2/s -j ACCEPT
 iptables -t filter -A syn-chain -j DROP
 iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 5/m -j ACCEPT
 iptables -A FORWARD -m unclean -j DROP

 ##Proteção contra Spoof
 echo "nospoof on" >> /etc/host.conf
 echo "spoofalert on" >> /etc/host.conf
" > firewall.sh
      bash firewall.sh
      mv firewall.sh /etc/init.d
      ln -s /etc/init.d/firewall.sh /etc/rc3.d/S54firewall
  echo -e "${verde}Firewall ativado com sucesso${NORMAL}"
  sleep 1
  }

function parar-firewall-permanente() {
 reset
 echo -e "${azul}Parando firewall...${NORMAL}"
 sleep 2
 iptables -F
 iptables -X
 iptables -t mangle -F
 iptables -P INPUT   ACCEPT
 iptables -P OUTPUT  ACCEPT
 iptables -P FORWARD ACCEPT
 echo "1" > /proc/sys/net/ipv4/ip_forward
 echo "0" > $i/tcp_syncookies
 echo "0" > $i/icmp_echo_ignore_broadcasts
 echo "0" > $i/icmp_ignore_bogus_error_response
 echo 1 > /proc/sys/net/ipv4/conf/all/accept_source_route
 echo 1 > /proc/sys/net/ipv4/conf/all/accept_redirects
 echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
 echo 0 > /proc/sys/net/ipv4/tcp_syncookies
 echo 0 > /proc/sys/net/ipv4/conf/default/rp_filter
 for i in /proc/sys/net/ipv4/conf/*; do
 echo "1" > $i/accept_redirects
 echo "1" > $i/accept_source_route
 echo "0" > $i/log_martians
 echo "0" > $i/rp_filter
 done
 rm /etc/rc3.d/S54firewall
 rm /etc/init.d/firewall.sh
 echo -e "${verde}Firewall parado com sucesso${NORMAL}"
 sleep 2
}

function novo-firewall() {
    echo -e "${ciano}Desenvolver firewall${NORMAL}"
    echo -e "${branco}Escreva as regras que seu firewall deverá ter${NORMAL}"
    echo -e "${branco}O script o configurará para inicio automático${NORMAL}"
    sleep 7
    echo "#!/bin/bash" > /etc/init.d/userFirewall.sh
    nano /etc/init.d/userFirewall.sh
    echo -e "${azul}Iniciando firewall..${NORMAL}"
    sleep 1
    bash /etc/init.d/userFirewall.sh
    cp -Rf /etc/init.d/userFirewall.sh /etc/rc3.d/
    mv /etc/rc3.d/userFirewall.sh /etc/rc3.d/S20userFirewall
    echo -e "${verde}Concluído!${NORMAL}"
    sleep 1
}

function bloquear-site() {
  echo -e "${ciano}Digite o endereço do site que deseja bloquear${branco}(ex:https://facebook.com)${NORMAL}"
  read blockResp
  clear
  echo "0.0.0.0 $blockResp" >> /etc/hosts
  echo -e "${verde}Site bloqueado!${branco}(você não terá mais acesso a esse site)${NORMAL}"
  echo -e "${branco}Para desfazer acesse o arquivo /etc/hosts e delete a linha:"
  echo -e "${branco}0.0.0.0 $blockResp ${NORMAL}"
  sleep 5
}

 echo -e "${amarelo}1)${verde} Iniciar firewall${NORMAL}"
 echo -e "${amarelo}2)${verde} Iniciar firewall ${branco}(Permanente)${NORMAL}"
 echo -e "${amarelo}0)${verm} Parar firewall${NORMAL}"
 echo -e "${amarelo}9)${verm} Parar firewall ${branco}(Permanente)${NORMAL}"
 echo -e "${amarelo}5)${ciano} Crie seu firewall${branco}(Avançado)${NORMAL}"
 echo -e "${amarelo}6)${ciano} Bloqueie um site${NORMAL}"
 echo ""
 echo -e "${verde}X)${amarelo}Voltar ao menu princípal${NORMAL}"

 read -n1 respFire


 case $respFire in

  1) iniciar-firewall;
     reset;
     firewall;
     ;;
    2) iniciar-firewall-permanente;
       reset;
       firewall;
       ;;

   0) parar-firewall;
      reset;
      firewall;
      ;;

   9) parar-firewall-permanente;
      reset;
      firewall;
      ;;

      5)reset;
        novo-firewall;
        firewall;
        ;;

        6)reset;
          bloquear-site;
          firewall;
          ;;

    X | x) fazer;
           ;;

     *) reset;
        firewall;

 esac
}


function gerarSenha() {
  letras='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  num='0123456789'
  especial='!@#$%*()_+'
  lista="$letras$num$especial"
  tamanho=${#lista}
  echo -e "${ciano}Digite o números de caractéres que a senha terá:"
  read contSenha
  if [[ $contSenha = ?(+|-)+([0-9]) ]];then #confere se a variável é numérica ou não
  clear
  echo -ne "${branco}Sua senha é: ${NORMAL}"
    for ((i=0;i<$contSenha;i++))
    do
      ordem=$((RANDOM % $tamanho + 1))''
      senha=$(echo $lista | cut -c "$ordem")
      echo -ne "${verde}$senha${NORMAL}"
    done

else
  clear
  echo -e "${verm}Digite apenas um valor numério sem letras${NORMAL}"
fi
  echo ""
  echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
  read -n1 pass
  case $pass in
    q | Q)reset;
          seguranca;
          ;;

          *)reset;
            gerarSenha;
            ;;
          esac
}

function anonimato() {
  function iniciar-modo-anonimo() {
    which tor > $pastaLogs/$horarioAtual-debug.log
    if [ $? == 0 ];then
      echo -e "${ciano}Iniciando serviço...${NORMAL}"
      service tor start > $pastaLogs/$horarioAtual-debug.log
      clear
      echo -e "${verde}Serviço inicializado!${NORMAL}"
      echo -e "${branco}Lembrando que essa opção não é 100% eficaz${NORMAL}"
      echo -e "${branco}Pois o script apenas inicializa o serviço tor, isto é sua conexão irá passar por proxys${NORMAL}"
      sleep 7
    else
      echo -e "${verm}Você precisa ter o TOR instaldo em sua máquina${NORMAL}"
      sleep 1
      clear
      echo -e "${ciano}Deseja instala-lo?[s/n]"
      read -n1 torInstResp
      case $torInstResp in
        s | S)echo -e "${ciano}Instalado o TOR...Aguarde${NORMAL}";
              echo "";
              apt-get install -y --force-yes tor | pv -W > $pastaLogs/$horarioAtual-debug.log;
              echo "";
              echo -e "${verde}TOR instalado!${NORMAL}";
              sleep 1;
              iniciar-modo-anonimo;
              ;;

        n | N) seguranca
        ;;

        *) fazer
      esac
    fi
  }

function parar-modo-anonimo() {
  echo -e "${ciano}Parando serviço de anonimato...${NORMAL}"
  service tor stop > $pastaLogs/$horarioAtual-debug.log
  echo ""
  echo -e "${verde}Serviço parado!${NORMAL}"
  sleep 1
}

echo -e "${amarelo}Selecione uma das opções:${NORMAL}"
echo ""
echo -e "${verde}1) ${azul}Iniciar serviço${NORMAL}"
echo -e "${verde}2) ${azul}Parar serviço${NORMAL}"
echo ""
echo -e "${branco}Voltar [Q]${NORMAL}"
read -n1 anonimatoResp
case $anonimatoResp in

  1)reset;
    iniciar-modo-anonimo;
    reset;
    seguranca;
    ;;

    2)reset;
      parar-modo-anonimo;
      reset;
      seguranca;
      ;;

      q | Q)reset;
            seguranca;
            ;;

            *)fazer;

          esac
}

submenu-item 1 "Firewall"
submenu-item 2 "Senhas"
submenu-item 3 "Anonimato"
echo ""
echo -e "${branco}Escolha uma das opção ou [Q] para voltar${NORMAL}"
read -n1 segResp
case $segResp in

  1)reset;
    firewall;
    seguranca;
    ;;

    2)reset;
      gerarSenha;
      seguranca;
      ;;

      3)reset;
        anonimato;
        seguranca;
        ;;

      q | Q)fazer;
      ;;

      *)reset;
        seguranca;
        ;;

      esac
}
