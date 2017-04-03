function down() {
  function baixar() {
    echo -e "${azul}Digite o link do arquivo à ser baixado:${NORMAL}"
    read downResp
    clear
    echo -e "${azul}Selecione o local e o nome para o arquivo, não esqueça de colocar sua extensão${NORMAL}"
    echo -e "${branco}Ex: arquivo${ciano}.deb ${branco}arquivo${ciano}.tar.gz${NORMAL}"
    sleep 2
    echo ""
    direResp=`zenity --file-selection --save`
    clear
    echo -e "${verde}Baixando arquivo${NORMAL}"
    echo -e "${branco}Pressione CTRL + C, para pausar"${NORMAL}
    echo ""
    sleep 2
    echo "$downResp" > /var/log/KS_arqdown.log
    echo "$direResp" > /var/log/KS_dirdown.log
    wget -O $direResp $downResp
    rm /var/log/KS_*.log
    echo ""
    echo -e "${verde}Download concluído${NORMAL}"
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    read -n1 conVOL
    case $conVol in
      Q | q)fazer;
      ;;

      *)fazer;
  esac
  }

function contBaixar() {
  if [ -e /var/log/KS_dirdown.log ];then
  echo -e "${azul}Continuando download anterior...${NORMAL}"
  echo -e "${branco}Pressione CTRL + C, para pausar"${NORMAL}
  echo ""
  sleep 2
  arqDown=`cat /var/log/KS_arqdown.log`
  dirDown=`cat /var/log/KS_dirdown.log`
  wget -c -O $dirDown $arqDown
  if [ $? = 0 ];then
  echo ""
  echo -e "${verde}Download concluído${NORMAL}"
  rm /var/log/KS_*.log
fi
  echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
  read -n1 concluVOL
  case $concluVol in
    Q | q)fazer;
    ;;

    *)fazer;
esac

else
  echo -e "${verm}Não há downloads${NORMAL}"
  sleep 2
  reset
  down
fi
}

function histDown() {
  echo -e "${azul}Excluindo histórico...${NORMAL}"
  rm /var/log/KS_*.log
  echo -e "${verde}Concluído!${NORMAL}"
  sleep 1
  reset
  down
}

ping -c1 google.com > /dev/null
if [ $? = 0 ];then
echo -e "${verde}Baixar arquivos da internet${NORMAL}"
echo ""
echo -e "${verm}1) ${amarelo}Baixar arquivo${NORMAL}"
echo -e "${verm}2) ${amarelo}Continuar download${NORMAL}"
echo -e "${verm}3) ${amarelo}Limpar histórico de download${NORMAL}"
if [ -e /var/log/KS_dirdown.log ] && [ -e /var/log/KS_dirdown.log ];then
  echo -e "${ciano}Você tem [1] download pendente${NORMAL}"
fi
echo ""
echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
echo -e "${azul}Escolha uma das opções:${NORMAL}"
read -n 1 wgetResp
case $wgetResp in
  1)reset;
    baixar;
    reset;
    down;
    ;;

    2)reset;
      contBaixar;
      reset;
      down;
      ;;

      3)reset;
        histDown;
        reset;
        down;
        ;;

      q | Q)fazer;
      ;;

      *)reset;
        down;
esac
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
