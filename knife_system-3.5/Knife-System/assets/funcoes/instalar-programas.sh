#!/bin/bash
function instalar-pacotes() {
  function pacote-local() {
    echo -e "${ciano}Selecione o pacote .deb a ser instalado:${NORMAL}"
    sleep 1
    pacotesDebSelecionado=`zenity --file-selection --multiple --separator=" " --file-filter=*.deb --title="Selecione o pacote .deb a ser instalado"`
    if [ -z $pacotesDebSelecionado ];then
      echo -e "${verm}Nenhum pacote .deb selecionado!${NORMAL}"
      sleep 1
      reset
      pacote-local
     else
      echo -e "${azul}Instalando pacote aguarde...${NORMAL}"
      sleep 1
      dpkg -i $pacotesDebSelecionado | pv -W > $pastaLogs/$horarioAtual-debug.log
      apt-get install -f -y --force-yes  | pv -W $pastaLogs/$horarioAtual-debug.log
      echo ""
      echo -e "${verde}Instalação concluída!${NORMAL}"
      sleep 1
    fi
  }

  function pacotes-remoto() {
    echo -e "${ciano}Informe o nome  do pacote à ser instalado:${NORMAL}"
    read pacoteRemotoSelecionado
    clear
    echo -e "${azul}Instalando pacote aguarde...${NORMAL}"
    apt-get -y --force-yes install $pacoteRemotoSelecionado | pv -W > $pastaLogs/$horarioAtual-debug.log
    echo ""
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  }
  
   banner "Instalador de pacotes"
   echo ""
   submenu-item 1 "Pacote .deb localmente"
   submenu-item 2 "Direto do repositório"
   echo ""
   echo -e "${branco}Pressione [ Q ] para voltar${NORMAL}"
   read -n1 pacoteResp
   case $pacoteResp in
     1)reset;
       pacote-local;
       inst;
       ;;

       2)reset;
         pacotes-remoto;
         inst;
         ;;

         Q | q)fazer;
         ;;
         *)reset;
           inst;
         esac
}
