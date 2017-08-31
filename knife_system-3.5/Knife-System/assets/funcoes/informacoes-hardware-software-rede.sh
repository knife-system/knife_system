function informacoes-sistema() {
  function informacoes-rede() {
    informacoesIwconfig=`iwconfig`
    informacoesIfconfig=`ifconfig`
    informacoesDns=`cat /etc/resolv.conf`
    informacoesRoute=`route`
    informacoesRedeLocal=`awk -F= '/^(psk|id)/{print $2}' /etc/NetworkManager/system-connections/"$(iwgetid -r)"`
    informacoesConexoesRede=`netstat -ant | awk '{print $NF,$3,$4,$5}' | grep -v '[a-z]' | sort | uniq -c`
    echo -e "${azul}Informações sobre a sua rede${NORMAL}"
    echo ""
    echo -e "${ciano}Equivale ao iwconfig:${NORMAL}"
    sleep 1
    echo -e "${branco} $iwconfig ${NORMAL}"
    echo ""
    echo -e "${ciano}Equivale ao ifconfig:${NORMAL}"
    echo -e "${branco}$ifconfig${NORMAL}"
    sleep 1
    echo ""
    echo -e "${ciano}Informções do DNS:${NORMAL}"
    sleep 1
    echo -e "${branco}$informacoesDns${NORMAL}"
    echo ""
    echo -e "${ciano}ROUTE:${NORMAL}"
    sleep 1
    echo -e "${branco}$informacoesRoute${NORMAL}"
    echo ""
    echo -e "${ciano}Rede que está conectado e senha:${NORMAL}"
    sleep 1
    echo -e "${branco}$informacoesRedeLocal${NORMAL}"
    echo ""
    echo -e "${ciano}Lista de conexões estabelecidas:${NORMAL}"
    sleep 1
    echo -e "${branco}$informacoesConexoesRede${NORMAL}"
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 redeResp
    case $redeResp in
      Q | q)reset;
            informacoes-sistema;
            ;;
     *)echo -e "${branco}Opção inválida${NORMAL}";
       sleep 2;
       informacoes-rede;
      ;;
    esac
  }

  function informacoes-hardware() {

    informacoesCPU=`cat /proc/cpuinfo;echo "";lscpu`
    informacoesMemoriaRam=`cat /proc/meminfo`
    informacoesEspacoDisco=`df -H /`
    informacoesRamUsada=`free -m`
    numeroSerial=`dmidecode -s system-serial-number`
    informacoesDistro=`lsb_release -a`
    totalPacotesInstalados=`dpkg -l | grep -c ^i`
    informacoesProcessador=`dmidecode -s processor-version`
    
    echo -e "${azul}Informações da CPU e memória(HD)"
    echo ""
    echo -e "${ciano}CPU:${NORMAL}"
    sleep 1
    echo -e "${branco} $informacoesCPU ${NORMAL}"
    echo ""
    echo -e "${ciano}RAM:${NORMAL}"
    sleep 1
    echo -e "${branco} $informacoesMemoriaRam ${NORMAL}"
    echo ""
    echo -e "${branco}$informacoesRamUsada ${NORMAL}"
    echo ""
    echo -e "${ciano}HD:${NORMAL}"
    sleep 1
    echo -e "${branco}$informacoesEspacoDisco${NORMAL}"
    echo ""
    echo -e "${ciano}Número de série:${NORMAL}"
    sleep 1
    echo -e "${branco}$numeroSerial${NORMAL}"
    echo ""
    echo -e "${ciano}Informação da distro instalada:${NORMAL}"
    sleep 1
    echo -e "${branco}$informacoesDistro${NORMAL}"
    echo ""
    echo -e "${ciano}Total de pacotes instalados${NORMAL}"
    sleep 1
    echo -e "${branco}$totalPacotesInstalados${NORMAL}"
    echo ""
    echo -e "${ciano}Nome do processador e versão:${NORMAL}"
    sleep 1
    echo -e "${branco}$informacoesProcessador${NORMAL}"
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 hardwareResp
    case $hardwareResp in
      Q | q)reset;
            informacoes-sistema;
            ;;

     *)echo -e "${verm}Opção inválida${NORMAL}";
       sleep 1;
       informacoes-hardware;
      ;;

    esac
  }

  function informacoes-arquitetura-processador() {
    echo -e "${amarelo}Arquitetura da sua máquina(x86_64 ou i386)${NORMAL}"
    echo ""
    arquiteturaProcessador=`arch`
    echo -e "${branco}A arquiteura da sua máquina é: ${verm}$arquiteturaProcessador${NORMAL}"
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 arquiteturaResp
    case $arquiteturaResp in

      Q | q)reset;
            informacoes-sistema;
            ;;
     *)reset;
       echo -e "${verm}Opção inválida${NORMAL}";
       sleep 2;
       informacoes-arquitetura-processador;
      ;;
    esac
  }
  function informacoes-kernel() {
    usuarioMaquina=`uname -n`
    kernelVersao=`uname -r`
    kernelExtra=`uname -v`
    echo -e "${ciano}Informações sobre o kernel${NORMAL}"
    echo ""
    echo -e ${verm} $usuarioMaquina ${branco}$kernelVersao ${verde}$kernelExtra ${NORMAL}
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 kernelResp
    case $kernelResp in
      Q | q)reset;
            informacoes-sistema;
            ;;
     *)reset;
       echo -e "${verm}Opção inválida${NORMAL}";
       sleep 2;
       informacoes-kernel;
      ;;
    esac
  }

  function informacoes-portas() {
    function verificar-nmap() {
      echo -e "${verm}Nmap não instalado${NORMAL}"
      sleep 1
      echo -e "${ciano}Deseja instalar o Nmap? [N/S]${NORMAL}"
      read -n1 nmapResp
      case $nmapResp in
        S | s)echo "";
            echo -e "${branco}Instalando Nmap.... Aguarde...${NORMAL}";
            echo "";
            apt-get -y --force-yes install nmap | pv -W > $pastaLogs/$horarioAtual-debug.log;
            apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log;
            reset;
            informacoes-sistema;
             ;;

        N | n)reset;
              informacoes-sistema;
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
    reset;verificar-nmap
  fi
  }

  function escanear-maquina-remota() {
    function instalar-netcat() {
      echo -e "${verm}Netcat não instalado${NORMAL}"
      sleep 1
      echo -e "${verde}Deseja instalar o Netcat? [N/S]${NORMAL}"
      read -n1 netcatResp
      case $netcatResp in
      
        S | s)echo "";
            echo -e "${branco}Instalando Netcat.... Aguarde...${NORMAL}";
            echo "";
            apt-get -y install netcat | pv -W > $pastaLogs/$horarioAtual-debug.log;
            reset;
            informacoes-sistema;
             ;;

        N | n)reset;
              informacoes-sistema;
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
      echo -e "${branco}Realizando scaneamento...${NORMAL}"
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
            echo -e "${branco}Instalando Debsecan.... Aguarde...${NORMAL}";
            echo "";
            apt-get -y install debsecan | pv -W > $pastaLogs/$horarioAtual-debug.log
            reset;
            informacoes-sistema;
             ;;

        N | n)reset;
              informacoes-sistema;
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
              informacoes-sistema;
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
          echo -e "${branco}Instalando Lynx.... Aguarde...${NORMAL}";
          echo "";
          apt-get -y install lynx | pv -W > /dev/null;
          reset;
          informacoes-sistema;
           ;;

      N | n)reset;
            informacoes-sistema;
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
          informacoes-sistema;
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
          echo -e "${branco}Instalando Lynis.... Aguarde...${NORMAL}";
          echo "";
          apt-get -y --force-yes install lynis | pv -W > /dev/null;
          reset;
          informacoes-sistema;
           ;;

      N | n)reset;
            informacoes-sistema;
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
          informacoes-sistema;
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
          informacoes-sistema;
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
          informacoes-sistema;
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
       informacoes-rede;
       reset;
       informacoes-sistema;
       ;;

       2)reset;
         informacoes-hardware;
         reset;
         informacoes-sistema;
         ;;

         3)reset;
           informacoes-kernel;
           reset;
           informacoes-sistema;
           ;;

           4)reset;
             Informacoes-arquitetura-processador;
             reset;
             informacoes-sistema;
             ;;

             5)reset;
               informacoes-portas;
               reset;
               informacoes-sistema;
               ;;

               6)reset;
                 escanear-maquina-remota;
                 reset;
                 informacoes-sistema;
                 ;;

                 7)reset;
                   verifiVul;
                   reset;
                   informacoes-sistema;
                   ;;

                   8)reset;
                     geoip;
                     reset;
                     informacoes-sistema;
                     ;;

                     9)reset;
                      checar;
                      reset;
                      informacoes-sistema;
                      ;;

                      10)reset;
                         tempo;
                         reset;
                         informacoes-sistema;
                         ;;

                         11)reset;
                             ip-site;
                             reset;
                             informacoes-sistema;
                             ;;

             Q | q)fazer;
                   ;;

                   *)reset;
                     informacoes-sistema;
    esac
}
