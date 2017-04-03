
# Área destinada a usuários avançados que possuam conhecimentos para modificar
# esse pequeno firewall de acordo com suas necessidades

function seguranca() {

function firew() {
 startFire() {
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

  #Descomente o serviço que deseja que o firewall não bloqueie

  ##Apache - Servidor Web
  #iptables -A INPUT -p tcp -m multiport --dports 80,443 -j ACCEPT

  ##Apache TomCat - Servidor Web
  #iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

  ##Bind - Servidor DNS
  #iptables -A INPUT -p udp --dport 53 -j ACCEPT

  ##DanGuardian - Servidor Proxy
  #iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

  ##ProFTP - Servidor FTP
  #iptables -A INPUT -p tcp --dport 21 -j ACCEPT
  #iptables -A INPUT -p tcp -m multiport --dports 49152:49162 -j ACCEPT

  ##Postfix - Servidor de E-mail
  #iptables -A INPUT -i $ilan -p tcp -m multiport --dports 25,110 -j ACCEPT
  #iptables -A INPUT -i $ilan -p tcp -m multiport --dports 465,995 -j ACCEPT
  #iptables -A INPUT -i $ilan -p tcp --sport 25 -j ACCEPT

  ##PostgreSQL - Servidor Postgresql
  #iptables -A INPUT -i $ilan -p tcp --dport 5432 -j ACCEPT

  ##SSH - Servidor SSH
  #iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 300 --hitcount 3 -j DROP
  #iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set
  #iptables -A INPUT -p tcp --dport 22 -j ACCEPT

  ##VNC - Servidor de Acesso Remoto
  #iptables -A INPUT -p tcp --dport 5900 -j ACCEPT
  #########################
  ##PROTOCOLOS E SERVIÇOS##
  #########################

  ##AIM
  #iptables -A INPUT -i $inet -p tcp --sport 5190 -j ACCEPT
  #iptables -A FORWARD -i $inet -p tcp --sport 5190 -j ACCEPT
  #iptables -A FORWARD -o $inet -p tcp --dport 5190 -j ACCEPT

  ##DNS - Serviço de Nomes de Dominios
  #iptables -A INPUT -p tcp -m multiport --sports 53,5353 -j ACCEPT
  #iptables -A INPUT -p udp -m multiport --sports 53,5353 -j ACCEPT
  #iptables -A FORWARD -p tcp -m multiport --sports 53,5353 -j ACCEPT
  #iptables -A FORWARD -p udp -m multiport --sports 53,5353 -j ACCEPT
  #iptables -A FORWARD -p tcp -m multiport --dports 53,5353 -j ACCEPT
  #iptables -A FORWARD -p udp -m multiport --dports 53,5353 -j ACCEPT

  ##FTP - Protocolo de Transferência de Arquivo
  #iptables -A INPUT -i $inet -p tcp --sport 21 -j ACCEPT
  #iptables -A FORWARD -i $inet -p tcp --sport 21 -j ACCEPT
  #iptables -A FORWARD -o $inet -p tcp --dport 21 -j ACCEPT

  # HTTP - Protocolo de Transferência de Hypertext
  #iptables -A INPUT -i $inet -p tcp -m multiport --sports 80,8080 -j ACCEPT
  #iptables -A FORWARD -i $inet -p tcp -m multiport --sports 80,8080 -j ACCEPT
  #iptables -A FORWARD -o $inet -p tcp -m multiport --dports 80,8080 -j ACCEPT

  ##HTTPS - Protocolo de Transferência de Hypertext Seguro
  #iptables -A INPUT -i $inet -p tcp --sport 443 -j ACCEPT
  #iptables -A FORWARD -i $inet -p tcp --sport 443 -j ACCEPT
  #iptables -A FORWARD -o $inet -p tcp --dport 443 -j ACCEPT

  ##IAPP - Protocolo de Ponto de Acesso
  #iptables -A INPUT -i $ilan -p udp --sport 2313 -j ACCEPT

  ##IPP - Protocolo de Impressão na Internet
  #iptables -A INPUT -i $ilan -p tcp --dport 631 -j ACCEPT
  #iptables -A INPUT -i $ilan -p udp -m multiport --dports 138,631 -j ACCEPT

  ##IRC - Internet Relay Chat
  #iptables -A INPUT -i $inet -p tcp --sport 6667 -j ACCEPT
  #iptables -A FORWARD -i $inet -p tcp --sport 6667 -j ACCEPT
  #iptables -A FORWARD -o $inet -p tcp --dport 6667 -j ACCEPT

  ##Microsoft-DS - Serviços de Diretório da Microsoft
  #iptables -A INPUT -i $ilan -p tcp --dport 445 -j ACCEPT
  #iptables -A INPUT -i $ilan -p tcp -m multiport --sports 139,445 -j ACCEPT

  ##MSNMS - Serviço de Mensageiro de Rede da Microsoft
  #iptables -A INPUT -i $inet -p tcp -m multiport --sports 1863,1900 -j ACCEPT
  #iptables -A INPUT -i $inet -p udp --sport 1900 -j ACCEPT
  #iptables -A FORWARD -i $inet -p tcp -m multiport --sports 1863,7001 -j ACCEPT
  #iptables -A FORWARD -i $inet -p udp --sport 7001 -j ACCEPT
  #iptables -A FORWARD -o $inet -p tcp -m multiport --dports 1863,7001 -j ACCEPT
  #iptables -A FORWARD -o $inet -p udp --dport 7001 -j ACCEPT

  ##NETBIOS-SSN - Serviço de Sessão NetBIOS
  #iptables -A INPUT -i $ilan -p udp -m multiport --dports 137,138 -j ACCEPT
  #iptables -A INPUT -i $ilan -p tcp --dport 139 -j ACCEPT

  ##NO-IP - Provedor de DNS Dinâmico
  #iptables -A INPUT -i $inet -p tcp --sport 8245 -j ACCEPT

  ##NTP - Protocolo para sincronização dos relógios
  #iptables -A INPUT -i $inet -p udp --sport 123 -j ACCEPT
  #iptables -A FORWARD -i $inet -p udp --sport 123 -j ACCEPT
  #iptables -A FORWARD -o $inet -p udp --dport 123 -j ACCEPT

  ##POP3S - Protocolo de Correio Seguro
  #iptables -A INPUT -i $inet -p tcp --sport 995 -j ACCEPT
  #iptables -A FORWARD -i $inet -p tcp --sport 995 -j ACCEPT
  #iptables -A FORWARD -o $inet -p tcp --dport 995 -j ACCEPT

  ##SSDP - Protocolo para Descoberta de Serviços Simples
  #iptables -A INPUT -i $ilan -p udp --dport 1900 -j ACCEPT

  ##SSH - Shell Seguro
  #iptables -A INPUT -p tcp --sport 22 -j ACCEPT
  #iptables -A FORWARD -i $inet -p tcp --sport 22 -j ACCEPT
  #iptables -A FORWARD -o $inet -p tcp --dport 22 -j ACCEPT

  ##SSMTP - Protocolo Simples para Transferência de Correio Seguro
  #iptables -A INPUT -i $inet -p tcp -m multiport --sports 465,587 -j ACCEPT
  #iptables -A FORWARD -i $inet -p tcp --sport 465 -j ACCEPT
  #iptables -A FORWARD -o $inet -p tcp --dport 465 -j ACCEPT

  ##TELNET
  #iptables -A INPUT -p tcp --sport 23 -j ACCEPT
  #iptables -A FORWARD -i $inet -p tcp --sport 23 -j ACCEPT
  #iptables -A FORWARD -o $inet -p tcp --dport 23 -j ACCEPT

  ##VNC - Computação em Rede Virtual
  #iptables -A INPUT -p tcp --sport 5900 -j ACCEPT
  #iptables -A FORWARD -i $inet -p tcp --sport 5900 -j ACCEPT
  #iptables -A FORWARD -o $inet -p tcp --dport 5900 -j ACCEPT

    echo ""
    echo -e "${verde}Firewall ativado com sucesso.${NORMAL}"
    sleep 1
}
 function stopFire() {
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
 }

function permFire() {
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

#Descomente o serviço que deseja que o firewall não bloqueie

##Apache - Servidor Web
#iptables -A INPUT -p tcp -m multiport --dports 80,443 -j ACCEPT

##Apache TomCat - Servidor Web
#iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

##Bind - Servidor DNS
#iptables -A INPUT -p udp --dport 53 -j ACCEPT

##DanGuardian - Servidor Proxy
#iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

##ProFTP - Servidor FTP
#iptables -A INPUT -p tcp --dport 21 -j ACCEPT
#iptables -A INPUT -p tcp -m multiport --dports 49152:49162 -j ACCEPT

##Postfix - Servidor de E-mail
#iptables -A INPUT -i $ilan -p tcp -m multiport --dports 25,110 -j ACCEPT
#iptables -A INPUT -i $ilan -p tcp -m multiport --dports 465,995 -j ACCEPT
#iptables -A INPUT -i $ilan -p tcp --sport 25 -j ACCEPT

##PostgreSQL - Servidor Postgresql
#iptables -A INPUT -i $ilan -p tcp --dport 5432 -j ACCEPT

##SSH - Servidor SSH
#iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 300 --hitcount 3 -j DROP
#iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set
#iptables -A INPUT -p tcp --dport 22 -j ACCEPT

##VNC - Servidor de Acesso Remoto
#iptables -A INPUT -p tcp --dport 5900 -j ACCEPT
#########################
##PROTOCOLOS E SERVIÇOS##
#########################

##AIM
#iptables -A INPUT -i $inet -p tcp --sport 5190 -j ACCEPT
#iptables -A FORWARD -i $inet -p tcp --sport 5190 -j ACCEPT
#iptables -A FORWARD -o $inet -p tcp --dport 5190 -j ACCEPT

##DNS - Serviço de Nomes de Dominios
#iptables -A INPUT -p tcp -m multiport --sports 53,5353 -j ACCEPT
#iptables -A INPUT -p udp -m multiport --sports 53,5353 -j ACCEPT
#iptables -A FORWARD -p tcp -m multiport --sports 53,5353 -j ACCEPT
#iptables -A FORWARD -p udp -m multiport --sports 53,5353 -j ACCEPT
#iptables -A FORWARD -p tcp -m multiport --dports 53,5353 -j ACCEPT
#iptables -A FORWARD -p udp -m multiport --dports 53,5353 -j ACCEPT

##FTP - Protocolo de Transferência de Arquivo
#iptables -A INPUT -i $inet -p tcp --sport 21 -j ACCEPT
#iptables -A FORWARD -i $inet -p tcp --sport 21 -j ACCEPT
#iptables -A FORWARD -o $inet -p tcp --dport 21 -j ACCEPT

# HTTP - Protocolo de Transferência de Hypertext
#iptables -A INPUT -i $inet -p tcp -m multiport --sports 80,8080 -j ACCEPT
#iptables -A FORWARD -i $inet -p tcp -m multiport --sports 80,8080 -j ACCEPT
#iptables -A FORWARD -o $inet -p tcp -m multiport --dports 80,8080 -j ACCEPT

##HTTPS - Protocolo de Transferência de Hypertext Seguro
#iptables -A INPUT -i $inet -p tcp --sport 443 -j ACCEPT
#iptables -A FORWARD -i $inet -p tcp --sport 443 -j ACCEPT
#iptables -A FORWARD -o $inet -p tcp --dport 443 -j ACCEPT

##IAPP - Protocolo de Ponto de Acesso
#iptables -A INPUT -i $ilan -p udp --sport 2313 -j ACCEPT

##IPP - Protocolo de Impressão na Internet
#iptables -A INPUT -i $ilan -p tcp --dport 631 -j ACCEPT
#iptables -A INPUT -i $ilan -p udp -m multiport --dports 138,631 -j ACCEPT

##IRC - Internet Relay Chat
#iptables -A INPUT -i $inet -p tcp --sport 6667 -j ACCEPT
#iptables -A FORWARD -i $inet -p tcp --sport 6667 -j ACCEPT
#iptables -A FORWARD -o $inet -p tcp --dport 6667 -j ACCEPT

##Microsoft-DS - Serviços de Diretório da Microsoft
#iptables -A INPUT -i $ilan -p tcp --dport 445 -j ACCEPT
#iptables -A INPUT -i $ilan -p tcp -m multiport --sports 139,445 -j ACCEPT

##MSNMS - Serviço de Mensageiro de Rede da Microsoft
#iptables -A INPUT -i $inet -p tcp -m multiport --sports 1863,1900 -j ACCEPT
#iptables -A INPUT -i $inet -p udp --sport 1900 -j ACCEPT
#iptables -A FORWARD -i $inet -p tcp -m multiport --sports 1863,7001 -j ACCEPT
#iptables -A FORWARD -i $inet -p udp --sport 7001 -j ACCEPT
#iptables -A FORWARD -o $inet -p tcp -m multiport --dports 1863,7001 -j ACCEPT
#iptables -A FORWARD -o $inet -p udp --dport 7001 -j ACCEPT

##NETBIOS-SSN - Serviço de Sessão NetBIOS
#iptables -A INPUT -i $ilan -p udp -m multiport --dports 137,138 -j ACCEPT
#iptables -A INPUT -i $ilan -p tcp --dport 139 -j ACCEPT

##NO-IP - Provedor de DNS Dinâmico
#iptables -A INPUT -i $inet -p tcp --sport 8245 -j ACCEPT

##NTP - Protocolo para sincronização dos relógios
#iptables -A INPUT -i $inet -p udp --sport 123 -j ACCEPT
#iptables -A FORWARD -i $inet -p udp --sport 123 -j ACCEPT
#iptables -A FORWARD -o $inet -p udp --dport 123 -j ACCEPT

##POP3S - Protocolo de Correio Seguro
#iptables -A INPUT -i $inet -p tcp --sport 995 -j ACCEPT
#iptables -A FORWARD -i $inet -p tcp --sport 995 -j ACCEPT
#iptables -A FORWARD -o $inet -p tcp --dport 995 -j ACCEPT

##SSDP - Protocolo para Descoberta de Serviços Simples
#iptables -A INPUT -i $ilan -p udp --dport 1900 -j ACCEPT

##SSH - Shell Seguro
#iptables -A INPUT -p tcp --sport 22 -j ACCEPT
#iptables -A FORWARD -i $inet -p tcp --sport 22 -j ACCEPT
#iptables -A FORWARD -o $inet -p tcp --dport 22 -j ACCEPT

##SSMTP - Protocolo Simples para Transferência de Correio Seguro
#iptables -A INPUT -i $inet -p tcp -m multiport --sports 465,587 -j ACCEPT
#iptables -A FORWARD -i $inet -p tcp --sport 465 -j ACCEPT
#iptables -A FORWARD -o $inet -p tcp --dport 465 -j ACCEPT

##TELNET
#iptables -A INPUT -p tcp --sport 23 -j ACCEPT
#iptables -A FORWARD -i $inet -p tcp --sport 23 -j ACCEPT
#iptables -A FORWARD -o $inet -p tcp --dport 23 -j ACCEPT

##VNC - Computação em Rede Virtual
#iptables -A INPUT -p tcp --sport 5900 -j ACCEPT
#iptables -A FORWARD -i $inet -p tcp --sport 5900 -j ACCEPT
#iptables -A FORWARD -o $inet -p tcp --dport 5900 -j ACCEPT
" > firewall.sh
      bash firewall.sh
      mv firewall.sh /etc/init.d
      ln -s /etc/init.d/firewall.sh /etc/rc3.d/S54firewall
  echo -e "${verde}Firewall ativado com sucesso${NORMAL}"
  sleep 1
  }

function permStopFire() {
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

function newFire() {
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

function blockSite() {
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

  1) startFire;
     reset;
     firew;
     ;;
    2) permFire;
       reset;
       firew;
       ;;

   0) stopFire;
      reset;
      firew;
      ;;

   9) permStopFire;
      reset;
      firew;
      ;;

      5)reset;
        newFire;
        firew;
        ;;

        6)reset;
          blockSite;
          firew;
          ;;

    X | x) fazer;
           ;;

     *) reset;
        firew;

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
  function anonyStart() {
    which tor > /dev/null
    if [ $? == 0 ];then
      echo -e "${ciano}Iniciando serviço...${NORMAL}"
      service tor start > /dev/null
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
              apt-get install -y --force-yes tor | pv -W > /dev/null;
              echo "";
              echo -e "${verde}TOR instalado!${NORMAL}";
              sleep 1;
              anonyStart;
              ;;

        n | N) seguranca
        ;;

        *) fazer
      esac
    fi
  }

function anonyStop() {
  echo -e "${ciano}Parando serviço de anonimato...${NORMAL}"
  service tor stop > /dev/null
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
    anonyStart;
    reset;
    seguranca;
    ;;

    2)reset;
      anonyStop;
      reset;
      seguranca;
      ;;

      q | Q)reset;
            seguranca;
            ;;

            *)fazer;

          esac
}

echo -e "${amarelo}1) ${verde}Firewall${NORMAL}"
echo -e "${amarelo}2) ${verde}Senhas${NORMAL}"
echo -e "${amarelo}3)${verde} Anonimato${NORMAL}"
echo ""
echo -e "${branco}Escolha uma das opção ou [Q] para voltar${NORMAL}"
read -n1 segResp
case $segResp in

  1)reset;
    firew;
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
