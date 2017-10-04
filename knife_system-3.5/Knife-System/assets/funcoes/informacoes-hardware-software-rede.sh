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
    echo -e "${branco}Voltar [Q]${NORMAL}"
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
      echo -e "${ciano}Deseja instalar o Netcat? [N/S]${NORMAL}"
      read -n1 netcatResp
      case $netcatResp in
      
        S | s)echo "";
            echo -e "${azul}Instalando Netcat.... Aguarde...${NORMAL}";
            echo "";
            apt-get -y --force-yes install netcat | pv -W > $pastaLogs/$horarioAtual-debug.log;
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
      read hostEscaneadoNetcat
      reset
      echo -e "${ciano}Digite o número da porta à ser verificada:${NORMAL}"
      read portaHostEscaneadoNetcat
      reset
      echo -e "${azul}Realizando scaneamento...${NORMAL}"
      netcat -w 1 $hostEscaneadoNetcat $portaHostEscaneadoNetcat >/dev/null
      if [ $? == 0 ];then
        echo -e "${verde}Porta $portaHostEscaneadoNetcat aberta!${NORMAL}"
        sleep 2

      else
        echo -e "${verm}Porta $portaHostEscaneadoNetcat fechada!${NORMAL}"
        sleep 2
      fi
    else
      reset
      instalar-netcat
    fi
  }

  function verificar-falhas-locais() {
    function instalar-debsecan() {
      echo -e "${verm}Debsecan não instalado${NORMAL}"
      sleep 1
      echo -e "${ciano}Deseja instalar o Debsecan? [N/S]${NORMAL}"
      read -n1 debsecanResp
      case $debsecanResp in
        S | s)echo "";
            echo -e "${azul}Instalando Debsecan.... Aguarde...${NORMAL}";
            echo "";
            apt-get -y --force-yes install debsecan | pv -W > $pastaLogs/$horarioAtual-debug.log;
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
      echo -e "${ciano}Verificando todas as vulnerabilidades da sua máquina local${NORMAL}"
      sleep 1
      debsecan --format detail
      echo ""
      echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
      read -n1 debsecanVoltar
      case $debsecanVoltar in
        Q | q)reset;
              informacoes-sistema;
              ;;
              *)reset;
              esac
    else
      reset
      instalar-debsecan
    fi
  }

function verificar-geolocalizacao-remota() {
  function instalar-lynx {
    echo -e "${verm}Lynx não instalado${NORMAL}"
    sleep 1
    echo -e "${ciano}Deseja instalar o Lynx? [N/S]${NORMAL}"
    read -n1 lynxResp
    case $lynxResp in
      S | s)echo "";
          echo -e "${azul}Instalando Lynx.... Aguarde...${NORMAL}";
          echo "";
          apt-get -y --force-yes install lynx | pv -W > $pastaLogs/$horarioAtual-debug.log;
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
  echo -e "${azul}Obtendo localização...${NORMAL}"
  sleep 1
  echo ""
  lynx -dump http://www.ip-adress.com/ip_tracer/$geoResp | awk '/IP country code/,/Local time in/' | tail -12 | sort | uniq -c | sort -n | awk {'print $2,$3,$4,$5,$6,$7,$8,$9'}
  echo ""
  echo -e "${branco}Pressione [ Q ] para voltar${NORMAL}"
  read -n1 geoipVoltar
  case $geoipVoltar in
    q | Q)reset;
          informacoes-sistema;
        esac

 else
   reset;
   instalar-lynx
 fi
}

function verificar-irregularidades-localmente() {
  function instalar-lynis {
    echo -e "${verm}Lynis não instalado${NORMAL}"
    sleep 1
    echo -e "${ciano}Deseja instalar o Lynx? [N/S]${NORMAL}"
    read -n1 lynisResp
    case $lynisResp in
      S | s)echo "";
          echo -e "${azul}Instalando Lynis.... Aguarde...${NORMAL}";
          echo "";
          apt-get -y --force-yes install lynis | pv -W > $pastaLogs/$horarioAtual-debug.log;
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
  read -n1 lynisVoltar
  case $lynisVoltar in
    q | Q)reset;
          informacoes-sistema;
        esac

 else
   reset;
   instalar-lynis
 fi
}

function previsao-tempo-brasil() {
  echo -e "${ciano}Previsão do previsao-tempo-brasil para todo o Brasil${NORMAL}"
  echo ""
  curl wttr.in/brasil
  echo ""
  echo -e "${branco}Pressione [ Q ] para voltar${NORMAL}"
  read -n1 tempoVoltar
  case $tempoVoltar in
    q | Q)reset;
          informacoes-sistema;ss
        esac
}

function obter-ip-site() {
  echo -e "${ciano}Digite a URL do site:${NORMAL}"
  read urlSite
  ipSite=`dig +short $urlSite`
  clear
  echo -e "${ciano}O ip do site é:${branco} $ipSite"
  echo -e "${branco}Pressione [ Q ] para voltar${NORMAL}"
  read -n1 ipVoltar
  case $ipVoltar in
    q | Q)reset;
          informacoes-sistema;
        esac
}

  banner "Obter informações da sua máquina"
  echo ""
  echo -e "${branco}Seu IP(externo): $meuEnderecoIp"
  echo ""
  submenu-item 1 "Informações de rede"
  submenu-item 2 "Informações do sistema"
  submenu-item 3 "Informações do kernel"
  submenu-item 4 "Arquitetura do processador"
  submenu-item 5 "Serviços e portas" "NMap"
  submenu-item 6 "Verificar serviço de um host remoto" "netcat"
  submenu-item 7 "Verificar vulnerabilidades do sistema" "debsecan"
  submenu-item 8 "Obter geolocalização de um IP" "Lynx"
  submenu-item 9 "Exibir o máximo de informações da distro" "Lynis"
  submenu-item 10 "Previsão do tempo"
  submenu-item 11 "Obter IP de um site"
  echo ""
  echo -e "${branco}Pressione [ Q ] para voltar ao menu principal${NORMAL}"
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
                   verificar-falhas-locais;
                   reset;
                   informacoes-sistema;
                   ;;

                   8)reset;
                     verificar-geolocalizacao-remota;
                     reset;
                     informacoes-sistema;
                     ;;

                     9)reset;
                      verificar-irregularidades-localmente;
                      reset;
                      informacoes-sistema;
                      ;;

                      10)reset;
                         previsao-tempo-brasil;
                         reset;
                         informacoes-sistema;
                         ;;

                         11)reset;
                             obter-ip-site;
                             reset;
                             informacoes-sistema;
                             ;;

             Q | q)fazer;
                   ;;

                   *)reset;
                     informacoes-sistema;
    esac
}
