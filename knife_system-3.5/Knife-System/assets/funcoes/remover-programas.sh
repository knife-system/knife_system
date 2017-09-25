function remover-programas() {
  banner "Remover programas instalados"
  echo ""
  echo -e $amarelo"Digite o nome do programa a ser removido:${NORMAL}"
  read programaRemovido
  sleep 1
  echo -e "${azul}Removendo $programaRemovido. Por favor, aguarde...${NORMAL}"
  apt-get -y --force-yes purge $programaRemovido | pv -W > $pastaLogs/$horarioAtual-debug.log
   if [ $? != 0 ];then
     echo -e "${verm}Erro ao remover programa! Para mais informações consulte ${pastaLogs}${NORMAL}"
     sleep 1
     reset
     exit 1
  fi

   apt-get -y --force-yes autoremove | pv -W > $pastaLogs/$horarioAtual-debug.log
   echo ""
   echo -e "${verde}$programaRemovido removido com sucesso${NORMAL}"
   sleep 2
}
