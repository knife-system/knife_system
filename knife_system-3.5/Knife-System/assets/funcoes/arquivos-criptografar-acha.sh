function tarefas-arquivos() {

function criptografar-descriptografar() {

 which pgp > /dev/null
 if [ $? == 0 ];then

function criptografar-arquivo() {
  echo -e "${ciano}Selecione o arquivo que deseja criptografar:${NORMAL}"
  sleep 1
  arquivoSelecionadoCriptografar=`zenity --file-selection --title="Selecione o arquivo"`
  reset
  echo -e "${amarelo}Insira a senha do arquivo a ser criptografado:${NORMAL}"
  pgp -c $arquivoSelecionadoCriptografar
  if [ $? == 0 ];then
    echo -e "${verde}Arquivo criptografado com sucesso, procure o arquivo $arquivoSelecionadoCriptografar com extensão .pgp"
    sleep 2
  else
    echo -e "${verm}Erro ao criptografar arquivo! Tente Novamente.${NORMAL}"
    sleep 1
  fi
}

function descriptografar-arquivo() {
  echo -e "${ciano}Selecione o arquivo .pgp que deseja descriptografar, em seguida digite a senha dele:${NORMAL}"
  sleep 3
  arquivoSelecionadoDescriptografar=`zenity --file-selection --file-filter=*.pgp --title="Selecione o arquivo .pgp"`
  reset
  echo -e "${ciano}Insira a senha para descriptografar:${NORMAL}"
  pgp $arquivoSelecionadoDescriptografar
  if [ $? == 0 ];then
    echo -e "${verde}Arquivo descriptagrafado com sucesso!${NORMAL}"
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
    criptografar-arquivo;
    reset;
    fazer;

    ;;

    2)reset;
    descriptografar-arquivo;
    reset;
    fazer;
    ;;

    q | Q)fazer;
    ;;

    *)reset;
    criptografar-descriptografar;
    ;;

  esac

else
  echo -e "${verm}Você precisa ter o ${amarelo}pgp${verm} instalado para usar essa opção.${NORMAL}"
  sleep 2
fi

}
function procurar-arquivo() {
   echo -e "${amarelo}Digite o nome do arquivo a ser procurado:${NORMAL}"
   read arquivoEncontrar 
   find $homeUser -user $usuario -name $arquivoEncontrar | grep $arquivoEncontrar
   echo ""
   echo -e "${branco}Pressione [ Q ] para voltar${NORMAL}"
   read -n1 localizarArquivoResp

   case $localizarArquivoResp in

     Q | q)fazer;
           ;;

      *)reset;
        procurar-arquivo;
    esac
}
banner "Criptografar e descriptografar arquivos"
echo ""
submenu-item 1 "Procurar arquivos"
submenu-item 2 "Criptografar/Descriptografar arquivos"
echo ""
echo -e "${branco}Pressione [Q] para voltar ${NORMAL}"
read -n1 arquivosResposta
case $arquivosResposta in

  1)reset;
    procurar-arquivo;
    ;;

    2)reset;
      criptografar-descriptografar;
      ;;

      Q | q)fazer;
      ;;

      *)reset;
      tarefas-arquivos;

    esac

}

