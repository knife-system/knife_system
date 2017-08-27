function programas-online() {

  function conky-manager() {
  if [ $arquiteturaProcessador == x86_64 ];then
    echo -e "${ciano}Baixando e instalando o Conky-Manager${NORMAL}"
    sleep 1
    wget $conky64 -O Conky-Manager.deb
    clear
    dpkg -i Conky-Manager.deb | pv -W >$pastaLogs/$horarioAtual-debug.log
    apt-get install -f -y --force-yes| pv -W >$pastaLogs/$horarioAtual-debug.log
    rm Conky-Manager.deb
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  else
    echo -e "${ciano}Baixando e instalando o Conky-Manager${NORMAL}"
    sleep 1
    wget $conky32 -O Conky-Manager.deb
    clear
    dpkg -i Conky-Manager.deb | pv -W >$pastaLogs/$horarioAtual-debug.log
    apt-get install -f -y --force-yes| pv -W >$pastaLogs/$horarioAtual-debug.log
    rm Conky-Manager.deb
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  fi
  }


function skype() {
if [ $arquiteturaProcessador = x86_64 ];then
  echo -e "${ciano}Instalando Skype. Aguarde...${NORMAL}"
  wget $skype32 -O skype.deb
  clear
  dpkg -i skype.deb | pv -W >$pastaLogs/$horarioAtual-debug.log
  apt-get install -f -y --force-yes| pv -W > $pastaLogs/$horarioAtual-debug.log
  rm skype.deb
  echo -e "${verde}Instalação concluída!${NORMAL}"
  sleep 1
else
  echo -e "${ciano}Baixando e instalando o Skype...${NORMAL}"
  dpkg --add-architecture i386
  wget $skype32 -O skype.deb
  clear
  apt-get update | pv -e > $pastaLogs/$horarioAtual-debug.log
  dpkg -i skype.deb | pv -W >$pastaLogs/$horarioAtual-debug.log
  apt-get install -f -y --force-yes| pv -W > $pastaLogs/$horarioAtual-debug.log
  rm skype.deb
  echo ""
  echo -e "${verde}Instalação concluída!${NORMAL}"
  sleep 1
fi
}

function chrome() {
  echo -e "${ciano}Baixando e instalando o chrome...${NORMAL}"
  wget $chrome64 -O chrome.deb
  clear
  dpkg -i chrome.deb | pv -W > $pastaLogs/$horarioAtual-debug.log
  apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
  rm chrome.deb
  echo ""
  echo -e "${verde}Instalação concluída!${NORMAL}"
  sleep 1
}

function atom-editor() {
  echo -e "${ciano}Baixando e instalando o Atom...${NORMAL}"
  sleep 1
  wget $atom64 -O atom.deb
  clear
  dpkg -i atom.deb | pv -W > $pastaLogs/$horarioAtual-debug.log
  apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
  rm atom.deb
  echo ""
  echo -e "${verde}Instalação concluída!${NORMAL}"
  sleep 1
}

function team-viewer(){
  echo -e "${ciano}Baixando e instalando o Team-Viewer...${NORMAL}"
  sleep 1
  if [ $arquiteturaProcessador = x86_64 ];then
    wget $teamViewer -O TeamViewer.deb
    clear
    dpkg --add-architecture i386
    dpkg -i TeamViewer.deb | pv -W >$pastaLogs/$horarioAtual-debug.log
    apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
    rm TeamViewer.deb
    apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
    echo ""
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  else
    wget $teamViewer -O TeamViewer.deb
    clear
    dpkg -i TeamViewer.deb | pv -W >$pastaLogs/$horarioAtual-debug.log
    rm TeamViewer.deb
    apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
    echo ""
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  fi

}

function video-downloader() {
if [ $arquiteturaProcessador == x86_64 ];then
  echo -e "${ciano}Baixando e instalando o 4KVideoDownloader...${NORMAL}"
  sleep 1
  wget $video64 -O 4KVideoDownloader.deb
  clear
  dpkg -i 4KVideoDownloader.deb | pv -W > $pastaLogs/$horarioAtual-debug.log
  apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
  rm 4KVideoDownloader.deb
  echo ""
  echo -e "${verde}Instalação concluída!${NORMAL}"
  sleep 1
else
  echo -e "${ciano}Baixando e instalando o 4KVideoDownloader...${NORMAL}"
  sleep 1
  wget $video32 -O 4KVideoDownloader.deb
  clear
  dpkg -i 4KVideoDownloader.deb | pv -W > $pastaLogs/$horarioAtual-debug.log
  apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
  rm 4KVideoDownloader.deb
  echo ""
  echo -e "${verde}Instalação concluída!${NORMAL}"
  sleep 1
fi
}

function sublime-text() {
  echo -e "${ciano}Baixando e instalando o Sublime Text 3...${NORMAL}"
  sleep 1
  if [ $arquiteturaProcessador = x86_64 ];then
    wget $sublime64 -O sublime-text3.deb
    clear
    dpkg -i sublime-text3.deb | pv -W $pastaLogs/$horarioAtual-debug.log
    rm sublime-text3.deb
    apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
    echo ""
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  else
    wget $sublime32 -O sublime-text3.deb
    clear
    dpkg -i sublime-text3.deb | pv -W > $pastaLogs/$horarioAtual-debug.log
    rm sublime-text3.deb
    apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
    echo ""
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  fi
}
function pycharm() {
  function pycharm-community() {
    echo -e "${ciano}Baixando e instalando o PyCharm-Community...${NORMAL}"
    sleep 1
    wget $pycharmCom -O /opt/PyCharm-Community 
    cd /opt;tar -zxvf PyCharm-Community;rm -rf PyCharm-Community
    cd pycharm-community-2016.2.3/bin;cp -Rf pycharm.sh /bin;mv /bin/pycharm.sh /bin/pycharm;chmod +x /bin/pycharm;
    apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
    echo ""
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  }

  function pycharm-professional() {
    echo -e "${ciano}Baixando e instalando o Pycharm-Professional...${NORMAL}"
    sleep 1
    wget $pycharmPro -O /opt/PyCharm-Professional
    cd /opt;tar -zxvf PyCharm-Professional;rm -rf PyCharm-Professional
    cd pycharm-2016.2.3/bin;cp -Rf pycharm.sh /bin;mv /bin/pycharm.sh /bin/pycharm;chmod +x /bin/pycharm;
    apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
    echo ""
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  }


echo -e "${ciano}1) ${verm}Pycharm Professional${branco}(completo)${NORMAL}"
echo -e "${ciano}2) ${verm}Pycharm Community${NORMAL}"
echo ""
echo -e "${verde}Escolha uma das opções:${NORMAL}"
read -n1 pyrResp
case $pyrResp in
  1)reset;
    pycharm-community;
    ;;

    2)reset;
      pycharm-professional;
      ;;

      *)reset;
        programas-online;
  esac
}

function google-earth() {
  echo -e "${ciano}Baixando e instalando o Google Earth...${NORMAL}"
  sleep 1
  if [ $arquiteturaProcessador = x86_64 ];then
    wget $earth64 -O google-earth.deb
    clear
    dpkg -i google-earth.deb
    rm google-earth.deb
    apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
    echo ""
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  else
    wget $earth32 -O google-earth.deb
    clear
    dpkg -i google-earth.deb
    rm google-earth.deb
    apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
    echo ""
    echo -e "${verde}Instalação concluída!${NORMAL}"
    sleep 1
  fi
}
ping -c1 google.com > /dev/null
if [ $? = 0 ];then
echo -e "${verm}*************************************${NORMAL}"
sleep 0.1
echo -e "${verde}            PROGRAMAS               ${NORMAL}"
sleep 0.1
echo -e "${verm}*************************************${NORMAL}"
sleep 0.1
echo ""
echo -e "${amarelo} 1)${azul} Skype${branco}(amd64+i386)${NORMAL}"
sleep 0.1
echo -e "${amarelo} 2)${azul} Conky-Manager${branco}(amd64+i386)${NORMAL}"
sleep 0.1
echo -e "${amarelo} 3)${azul} Chrome${branco}(amd64)${NORMAL}"
sleep 0.1
echo -e "${amarelo} 4)${azul} Atom${branco}(amd64)${NORMAL}"
sleep 0.1
echo -e "${amarelo} 5)${azul} Team-Viewer${branco}(amd64+i386)${NORMAL}"
sleep 0.1
echo -e "${amarelo} 6)${azul} 4KVideoDownloader${branco}(amd64+i386)${NORMAL}"
sleep 0.1
echo -e "${amarelo} 7)${azul} Sublime-Text3${branco}(amd64+i386)${NORMAL}"
sleep 0.1
echo -e "${amarelo} 8)${azul} PyCharm${branco}(amd64)${NORMAL}"
sleep 0.1
echo -e "${amarelo} 9)${azul} GoogleEarth${branco}(i386+amd64)${NORMAL}"
echo ""
echo "pressione [ Q ] para voltar ao menu principal"
echo -e "${verm}Escolha qual pacote deseja instalar:${NORMAL}"
read -n1 voltarProgramasOnline
 while [ voltarProgramasOnline != '' ]; do
 case $voltarProgramasOnline in

   1)reset;
     skype;
     reset;
     programas-online;
     ;;

     2)reset;
      conky-manager;
      reset;
      programas-online;
      ;;

      3)reset;
       chrome;
       reset;
       programas-online;
       ;;

       4)reset;
         atom-editor;
         reset;
         programas-online;
         ;;

         5)reset;
           team-viewer;
           reset;
           programas-online;
           ;;

           6)reset;
             video-downloader;
             reset;
             programas-online;
             ;;

             7)reset;
               sublime-text;
               reset;
               programas-online;
               ;;

               8)reset;
                 pycharm;
                 reset;
                 programas-online;
                 ;;

                 9)reset;
                   google-earth;
                   reset;
                   programas-online;
                   ;;

         Q | q)fazer;
         ;;

  *) reset;
     programas-online;

esac
done
else
  echo -e "${verm}Não conectado${NORMAL}"
  echo ""
  echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
  read -n1 notCon
  case $notCon in
    Q | q)fazer;
    ;;

    *)fazer;
esac
  fi
}
