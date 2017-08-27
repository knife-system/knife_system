function infos() {
  function rede() {
    iwco=`iwconfig`
    ifco=`ifconfig`
    dns=`cat /etc/resolv.conf`
    rot=`route`
    mywifi=`awk -F= '/^(psk|id)/{print $2}' /etc/NetworkManager/system-connections/"$(iwgetid -r)"`
    conexoes=`netstat -ant | awk '{print $NF,$3,$4,$5}' | grep -v '[a-z]' | sort | uniq -c`
    echo -e "${amarelo}Informações sobre a sua rede${NORMAL}"
    echo ""
    sleep 2
    echo -e "${amarelo}Equivale ao iwconfig:${NORMAL}"
    sleep 1
    echo -e "${azul} $iwco ${NORMAL}"
    echo ""
    echo -e "${amarelo}Equivale ao ifconfig:${NORMAL}"
    echo -e "${azul}$ifco${NORMAL}"
    sleep 1
    echo ""
    echo -e "${amarelo}Informções do DNS:${NORMAL}"
    sleep 1
    echo -e "${azul}$dns${NORMAL}"
    echo ""
    echo -e "${amarelo}ROUTE:${NORMAL}"
    sleep 1
    echo -e "${azul}$rot${NORMAL}"
    echo ""
    echo -e "${amarelo}Rede que está conectado e senha:${NORMAL}"
    sleep 1
    echo -e "${azul}$mywifi${NORMAL}"
    echo ""
    echo -e "${amarelo}Lista de conexões estabelecidas:${NORMAL}"
    sleep 1
    echo -e "${azul}$conexoes${NORMAL}"
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 redeResp
    case $redeResp in
      Q | q)reset;
            infos;
            ;;
     *)echo -e "${verm}Opção inválida${NORMAL}";
       sleep 2;
       rede;
      ;;
    esac
  }

  function hard() {
    cpui=`cat /proc/cpuinfo;echo "";lscpu`
    memi=`cat /proc/meminfo`
    disc=`df -H /`
    fre=`free -m`
    srNum=`dmidecode -s system-serial-number`
    distroInfo=`lsb_release -a`
    totpacotes=`dpkg -l | grep -c ^i`
    processadorName=`demidecode -s processor-version`
    echo -e "${amarelo}Informações da CPU e memória(HD)"
    echo ""
    echo -e "${amarelo}CPU:${NORMAL}"
    sleep 1
    echo -e "${azul} $cpui ${NORMAL}"
    echo ""
    echo -e "${amarelo}RAM:${NORMAL}"
    sleep 1
    echo -e "${azul} $memi ${NORMAL}"
    echo ""
    echo -e "${azul} $fre ${NORMAL}"
    echo ""
    echo -e "${amarelo}HD:${NORMAL}"
    sleep 1
    echo -e "${azul}$disc${NORMAL}"
    echo ""
    echo -e "${amarelo}Número de série:${NORMAL}"
    sleep 1
    echo -e "${azul}$srNum${NORMAL}"
    echo ""
    echo -e "${amarelo}Informação da distro instalada:${NORMAL}"
    sleep 1
    echo -e "${azul}$distroInfo${NORMAL}"
    echo ""
    echo -e "${amarelo}Total de pacotes instalados${NORMAL}"
    sleep 1
    echo -e "${azul}$totpacotes${NORMAL}"
    echo ""
    echo -e "${amarelo}Nome do processador e versão:${NORMAL}"
    sleep 1
    echo -e "${azul}$processadorName${NORMAL}"
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 hardResp
    case $hardResp in
      Q | q)reset;
            infos;
            ;;
     *)echo -e "${verm}Opção inválida${NORMAL}";
       sleep 2;
       hard;
      ;;
    esac
  }

  function arqui() {
    echo -e "${amarelo}Arquitetura da sua máquina(x86_64 ou i386)${NORMAL}"
    echo ""
    archi=`arch`
    echo -e "${azul}A arquiteura da sua máquina é: ${verm}$archi${NORMAL}"
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 arquiResp
    case $arquiResp in
      Q | q)reset;
            infos;
            ;;
     *)reset;
       echo -e "${verm}Opção inválida${NORMAL}";
       sleep 2;
       arqui;
      ;;
    esac
  }
  function ker() {
    unn=`uname -n`
    unr=`uname -r`
    unv=`uname -v`
    echo -e "${amarelo}Informações sobre o kernel${NORMAL}"
    echo ""
    echo -e ${verm} $unn ${azul}$unr ${verde}$unv ${NORMAL}
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 kerResp
    case $kerResp in
      Q | q)reset;
            infos;
            ;;
     *)reset;
       echo -e "${verm}Opção inválida${NORMAL}";
       sleep 2;
       ker;
      ;;
    esac
  }

  function ports() {
    function pergNmap() {
      echo -e "${verm}Nmap não instalado${NORMAL}"
      sleep 1
      echo -e "${verde}Deseja instalar o Nmap? [N/S]${NORMAL}"
      read -n1 nmapResp
      case $nmapResp in
        S | s)echo "";
            echo -e "${azul}Instalando Nmap.... Aguarde...${NORMAL}";
            echo "";
            apt-get -y install nmap | pv -W >/dev/null;
            reset;
            infos;
             ;;

        N | n)reset;
              infos;
              ;;
      esac

    }
    echo -e "${amarelo}Informações sobre os serviços e portas rodando${NORMAL}"
    echo ""
    which nmap > /dev/null
    if [ $? == 0 ];then
    nmap -sV localhost
    echo ""
    echo -e "${verde}Voltar [Q]${NORMAL}"
    read -n1 voltResp
    case $voltResp in
      Q | Q)fazer;
    esac
  else
    reset;pergNmap
  fi
  }

  function scan-host() {
    function instalar-netcat() {
      echo -e "${verm}Netcat não instalado${NORMAL}"
      sleep 1
      echo -e "${verde}Deseja instalar o Netcat? [N/S]${NORMAL}"
      read -n1 netcatResp
      case $netcatResp in
        S | s)echo "";
            echo -e "${azul}Instalando Netcat.... Aguarde...${NORMAL}";
            echo "";
            apt-get -y install netcat | pv -W > /dev/null;
            reset;
            infos;
             ;;

        N | n)reset;
              infos;
              ;;

      esac
    }
    which netcat > /dev/null
    if [ $? == 0 ];then
      echo -e "${ciano}Digite o IP ou DNS do host remoto: ${NORMAL}"
      read remoteHost
      reset
      echo -e "${ciano}Digite o número da porta à ser verificada:${NORMAL}"
      read remotePort
      reset
      echo -e "${azul}Realizando scaneamento...${NORMAL}"
      netcat -w 1 $remoteHost $remotePort >/dev/null
      if [ $? == 0 ];then
        echo -e "${verde}Porta $remotePort aberta!${NORMAL}"
        sleep 2

      else
        echo -e "${verm}Porta $remotePort fechada!${NORMAL}"
        sleep 2
      fi
    else
      reset
      instalar-netcat
    fi
  }

  function verifiVul() {
    function debsecan-inst() {
      echo -e "${verm}Debsecan não instalado${NORMAL}"
      sleep 1
      echo -e "${verde}Deseja instalar o Debsecan? [N/S]${NORMAL}"
      read -n1 secanResp
      case $secanResp in
        S | s)echo "";
            echo -e "${azul}Instalando Debsecan.... Aguarde...${NORMAL}";
            echo "";
            apt-get -y install debsecan | pv -W > /dev/null;
            reset;
            infos;
             ;;

        N | n)reset;
              infos;
              ;;

      esac
    }
    which debsecan > /dev/null
    if [ $? == 0 ];then
      echo -e "${ciano}Verificando todas as vulnerabilidades...${NORMAL}"
      sleep 1
      debsecan --format detail
      echo ""
      echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
      read -n1 debScResp
      case $debScResp in
        Q | q)reset;
              infos;
              ;;
              *)clear;
                echo -e "${verm}Opção inválida!${NORMAL}";
                sleep 1;
                reset;
              esac
    else
      reset
      debsecan-inst
    fi
  }

function geoip() {
  function geoip-inst {
    echo -e "${verm}Lynx não instalado${NORMAL}"
    sleep 1
    echo -e "${verde}Deseja instalar o Lynx? [N/S]${NORMAL}"
    read -n1 lynxResp
    case $lynxResp in
      S | s)echo "";
          echo -e "${azul}Instalando Lynx.... Aguarde...${NORMAL}";
          echo "";
          apt-get -y install lynx | pv -W > /dev/null;
          reset;
          infos;
           ;;

      N | n)reset;
            infos;
            ;;

    esac
  }
  which lynx > /dev/null
  if [ $? == 0 ];then
  echo -e "${ciano}Digite o IP a ser localizado:${NORMAL}"
  read geoResp
  echo -e "${verde}Obtendo localização...${NORMAL}"
  sleep 1
  echo ""
  lynx -dump http://www.ip-adress.com/ip_tracer/$geoResp | awk '/IP country code/,/Local time in/' | tail -12 | sort | uniq -c | sort -n | awk {'print $2,$3,$4,$5,$6,$7,$8,$9'}
  echo ""
  echo -e "${branco}Pressione [ Q ] para voltar${NORMAL}"
  read -n1 geoResp
  case $geResp in
    q | Q)reset;
          infos;
        esac

 else
   reset;
   geoip-inst
 fi
}

function checar() {
  function check-inst {
    echo -e "${verm}Lynis não instalado${NORMAL}"
    sleep 1
    echo -e "${verde}Deseja instalar o Lynx? [N/S]${NORMAL}"
    read -n1 lynisInstall
    case $lynisInstall in
      S | s)echo "";
          echo -e "${azul}Instalando Lynis.... Aguarde...${NORMAL}";
          echo "";
          apt-get -y --force-yes install lynis | pv -W > /dev/null;
          reset;
          infos;
           ;;

      N | n)reset;
            infos;
            ;;

    esac
  }
  which lynis > /dev/null
  if [ $? == 0 ];then
  sleep 1
  echo ""
  lynis --check-all
  echo ""
  echo -e "${branco}Pressione [ Q ] para voltar${NORMAL}"
  read -n1 checkoutResp
  case $checkoutResp in
    q | Q)reset;
          infos;
        esac

 else
   reset;
   check-inst
 fi
}

function tempo() {
  echo -e "${ciano}Previsão do tempo para todo o Brasil${NORMAL}"
  echo ""
  curl wttr.in/brasil
  echo ""
  echo -e "${branco}Pressione [ Q ] para voltar${NORMAL}"
  read -n1 tempResp
  case $tempResp in
    q | Q)reset;
          infos;
        esac
}

function ip-site() {
  echo -e "${ciano}Digite a URL do site:${NORMAL}"
  read urlSite
  ipSite=`dig +short $urlSite`
  clear
  echo -e "${verde}O ip do site é:${branco} $ipSite"
  echo -e "${branco}Pressione [ Q ] para voltar${NORMAL}"
  read -n1 ipResp
  case $ipResp in
    q | Q)reset;
          infos;
        esac
}

  echo -e "${amarelo}Obter informaçõe do seu computador ou notebook:${NORMAL}"
  echo -e "${branco}Seu IP(externo): $meuEnderecoIp"
  echo ""
  echo -e "${verm}1) ${verde}Informações de rede${NORMAL}"
  sleep 0.1
  echo -e "${verm}2) ${verde}Informações do sistema${NORMAL}"
  sleep 0.1
  echo -e "${verm}3) ${verde}Informações do kernel${NORMAL}"
  sleep 0.1
  echo -e "${verm}4) ${verde}Arquitetura do processador${NORMAL}"
  sleep 0.1
  echo -e "${verm}5) ${verde}Serviços e portas${branco}(Nmap)${NORMAL}"
  sleep 0.1
  echo -e "${verm}6) ${verde}Verificar serviço de um host remoto${branco}(netcat)${NORMAL}"
  sleep 0.1
  echo -e "${verm}7) ${verde}Verificar vulnerabilidades do sistema${branco}(debsecan)${NORMAL}"
  sleep 0.1
  echo -e "${verm}8) ${verde}Obter geolocalização de um IP${branco}(lynx)${NORMAL}"
  sleep 0.1
  echo -e "${verm}9) ${verde}Verificar distro completamente${branco}(lynis)${NORMAL}"
  sleep 0.1
  echo -e "${verm}10) ${verde}Previsão do tempo${NORMAL}"
  sleep 0.1
  echo -e "${verm}11) ${verde}Obter IP de um site${NORMAL}"
  echo ""
  echo -e "${verde}Q) ${verm}Voltar ao menu princípal${NORMAL}"
  read -n2 respInfo
  case $respInfo in
    1) reset;
       rede;
       reset;
       infos;
       ;;

       2)reset;
         hard;
         reset;
         infos;
         ;;

         3)reset;
           ker;
           reset;
           infos;
           ;;

           4)reset;
             arqui;
             reset;
             infos;
             ;;

             5)reset;
               ports;
               reset;
               infos;
               ;;

               6)reset;
                 scan-host;
                 reset;
                 infos;
                 ;;

                 7)reset;
                   verifiVul;
                   reset;
                   infos;
                   ;;

                   8)reset;
                     geoip;
                     reset;
                     infos;
                     ;;

                     9)reset;
                      checar;
                      reset;
                      infos;
                      ;;

                      10)reset;
                         tempo;
                         reset;
                         infos;
                         ;;

                         11)reset;
                             ip-site;
                             reset;
                             infos;
                             ;;

             Q | q)fazer;
                   ;;

                   *)reset;
                     infos;
    esac
}
