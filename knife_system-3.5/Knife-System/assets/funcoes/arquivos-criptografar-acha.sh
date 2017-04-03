function arquivos() {

function arqpgp() {

 which pgp > /dev/null
 if [ $? == 0 ];then

function arqCrypt() {
  echo -e "${ciano}Selecione o arquivo que deseja criptografar:${NORMAL}"
  sleeep 1
  arqCrp=`zenity --file-selection --title="Selecione o arquivo"`
  reset
  echo -e "${amarelo}Insira a senha do arquivo${NORMAL}"
  pgp -c $arqCrp
  if [ $? == 0 ];then
    echo -e "${verde}Arquivo criptagrafado com sucesso, procure o arquivo $arqCrp com extensão .pgp"
    sleep 2
  else
    echo -e "${verm}Erro ao criptografar arquivo! Tente Novamente.${NORMAL}"
    sleep 1
  fi
}

function arqdecry() {
  echo -e "${ciano}Selecione o arquivo .pgp que deseja descriptografar, em seguida digite a senha dele:${NORMAL}"
  sleep 3
  arqDcry=`zenity --file-selection --file-filter=*.pgp --title="Selecione o arquivo .pgp"`
  reset
  echo -e "${ciano}Insira a senha para descriptografar:${NORMAL}"
  pgp $arqDcry
  if [ $? == 0 ];then
    echo -e "${verde}Arquivo descriptagrafado com sucesso!"
    sleep 1
  else
    echo -e "${verm}Erro ao descriptografar arquivo! Tente Novamente.${NORMAL}"
    sleep 1
  fi
}

echo -e "${verde}1) ${azul}Criptografar arquivo${NORMAL}"
echo -e "${verde}2) ${azul}Descriptografar arquivo${NORMAL}"
echo ""
echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
read -n1 cryptResp

case $cryptResp in
  1)reset;
    arqCrypt;
    reset;
    fazer;

    ;;

    2)reset;
    arqdecry;
    reset;
    fazer;
    ;;

    q | Q)fazer;
    ;;

    *)reset;
    arqpgp;
    ;;

  esac

else
  echo -e "${verm}Você precisa ter o ${amarelo}pgp${verm} instalado para usar essa opção.${NORMAL}"
  sleep 2
fi

}
function location() {
   echo -e $verm"#############################################${NORMAL}"
   echo -e "                   ${verde}Procurar               ${NORMAL}"
   echo -e $verm"#############################################${NORMAL}"
   echo ""
   echo -e $amarelo"Digite o nome do arquivo:${NORMAL}"
   read arquivoEncontrar
   echo -e "${verm}Atualizando banco de dados, dependendo do espaço ocupado no seu HD isso${NORMAL}"
   echo -e "${verm}poderá levar alguns minutos. Aguarde...${NORMAL}"
   echo ""
   updatedb
   locate $arquivoEncontrar | grep $arquivoEncontrar
   echo ""
   echo -e "${verde}Pressione ${amarelo}[ Q ] ${verde}para voltar${NORMAL}"
   read -n1 locatResp

   case $locatResp in

     Q | q)fazer;
           ;;

      *)reset;
        location;
    esac
}

echo -e "${ciano}O que deseja fazer?${NORMAL}"
echo ""
echo -e "${verm}1) ${verde}Procurar arquivos${NORMAL}"
echo -e "${verm}2) ${verde}Criptografar/Descriptografar arquivos${NORMAL}"
echo ""
echo -e "${branco}Pressione [Q] para voltar ${NORMAL}"
read -n1 arquivosResposta
case $arquivosResposta in

  1)reset;
    location;
    ;;

    2)reset;
      arqpgp;
      ;;

      Q | q)fazer;
      ;;

      *)reset;
      arquivos;

    esac

}

