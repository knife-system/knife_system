function baixar-arquivos-online() {
  
  # Cria a pasta onde ficará os logs de arquivos baixados

  pastaLogsBaixar=${pastaLogs}/baixar-arquivos
  if [ -e /var/log/KnifeSystem ];then
            echo "" > /dev/null
      else 
            mkdir $pastaLogsBaixar
      fi

  function baixar() {
    echo -e "${azul}Digite o link do arquivo à ser baixado:${NORMAL}"
    read linkArquivoBaixar
    clear
    echo -e "${azul}Selecione o local e o nome para o arquivo, não esqueça de colocar sua extensão${NORMAL}"
    echo -e "${branco}Ex: arquivo${ciano}.deb ${branco}arquivo${ciano}.tar.gz${NORMAL}"
    sleep 2
    echo ""
    diretorioSalvarArquivo=`zenity --file-selection --save`
    clear
    echo -e "${verde}Baixando arquivo${NORMAL}"
    echo -e "${branco}Pressione CTRL + C, para pausar"${NORMAL}
    echo ""
    sleep 2
    echo "$linkArquivoBaixar" > $pastaLogsBaixar/baixar-arquivo.log
    echo "$diretorioSalvarArquivo" > $pastaLogsBaixar/baixar-diretorio.log
    wget -O $diretorioSalvarArquivo $linkArquivoBaixar
    rm $pastaLogsBaixar/*
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

function continuar-baixar() {
  if [ -e $pastaLogsBaixar/baixar-diretorio.log ];then
  echo -e "${azul}Continuando download anterior...${NORMAL}"
  echo -e "${branco}Pressione CTRL + C, para pausar"${NORMAL}
  echo ""
  sleep 2
  arquivoContinuarBaixando=`cat $pastaLogsBaixar/baixar-arquivo.log`
  pastaContinuarBaixando=`cat $pastaLogsBaixar/baixar-diretorio.log`
  wget -c -O $pastaContinuarBaixando $arquivoContinuarBaixando
  if [ $? = 0 ];then
  echo ""
  echo -e "${verde}Download concluído${NORMAL}"
  rm $pastaLogsBaixar/*
fi
  echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
  read -n1 continuarBaixarResp
  case $continuarBaixarResp in
    Q | q)fazer;
    ;;

    *)fazer;
esac

else
  echo -e "${verm}Não há downloads pendentes${NORMAL}"
  sleep 2
fi
}

function limpar-historico() {
  echo -e "${azul}Excluindo histórico...${NORMAL}"
  rm $pastaLogsBaixar/*
  echo -e "${verde}Concluído!${NORMAL}"
  sleep 1
}

ping -c1 google.com > /dev/null
if [ $? = 0 ];then
echo -e "${verde}Baixar arquivos da internet${NORMAL}"
echo ""
echo -e "${verm}1) ${amarelo}Baixar arquivo${NORMAL}"
echo -e "${verm}2) ${amarelo}Continuar download${NORMAL}"
echo -e "${verm}3) ${amarelo}Limpar histórico de download${NORMAL}"
if [ -e $pastaLogsBaixar/baixar-arquivo.log ] && [ -e $pastaLogsBaixar/baixar-diretorio.log ];then
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
    baixar-arquivos-online;
    ;;

    2)reset;
      continuar-baixar;
      reset;
      baixar-arquivos-online;
      ;;

      3)reset;
        limpar-historico;
        reset;
        baixar-arquivos-online;
        ;;

      q | Q)fazer;
      ;;

      *)reset;
        baixar-arquivos-online;
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
