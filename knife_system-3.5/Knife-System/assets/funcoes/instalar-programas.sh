#!/bin/bash
function instal() {
  function deb() {
    echo -e "${ciano}Selecione o pacote .deb a ser instalado:${NORMAL}"
    echo -e "${ciano}Selecione múltiplos pacotes caso for necessário também${NORMAL}"
    echo -e "${ciano}Basta selecionar${NORMAL}"
    sleep 1
    debResp=`zenity --file-selection --multiple --separator=" " --file-filter=*.deb --title="Selecione o pacote .deb a ser instalado"`
    if [ -z $debResp ];then
      echo -e "${verm}Nenhum pacote .deb selecionado!${NORMAL}"
      sleep 1
      reset
      install
     else
      echo -e "${azul}Instalando pacote aguarde...${NORMAL}"
      sleep 1
      dpkg -i $debResp | pv -W > /dev/null
      apt-get install -f -y --force-yes  | pv -W /dev/null
      echo ""
      echo -e "${verde}Instalação concluída!${NORMAL}"
      sleep 1
    fi
  }

  function instRep() {
    echo -e "${ciano}Informe o nome  do pacote à ser instalado:${NORMAL}"
    read pacResp
    clear
    echo -e "${azul}Instalando pacote aguarde...${NORMAL}"
    apt-get -y --force-yes install $pacResp | pv -W > /dev/null
    echo ""
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  }
   echo -e $verm"#############################################${NORMAL}"
   echo -e "                   ${verde}Instalar               ${NORMAL}"
   echo -e $verm"#############################################${NORMAL}"
   echo ""
   echo -e $amarelo"Como deseja instalar?${NORMAL}"
   echo ""
   echo -e "${ciano}1) ${azul}Pacote .deb${NORMAL}"
   echo -e "${ciano}2) ${azul}Direto do repositório${NORMAL}"
   echo ""
   echo -e "${verde}Pressione ${amarelo}[ Q ] ${verde}para voltar${NORMAL}"
   read -n1 instResp
   case $instResp in
     1)reset;
       deb;
       inst;
       ;;

       2)reset;
         instRep;
         inst;
         ;;

         Q | q)fazer;
         ;;
         *)reset;
           inst;
         esac
}
