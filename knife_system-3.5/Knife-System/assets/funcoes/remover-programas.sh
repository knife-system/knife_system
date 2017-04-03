function remov() {
   echo -e $verm"#############################################${NORMAL}"
   echo -e "                   ${verde}Remover               ${NORMAL}"
   echo -e $verm"#############################################${NORMAL}"
   echo ""
   echo -e $amarelo"Digite o nome do programa a ser removido:${NORMAL}"
   read rmove
   sleep 1
   echo -e "${azul}Removendo $rmove. Por favor, aguarde...${NORMAL}"
   apt-get -y --force-yes purge $rmove | pv -W > /var/log/KS_remove.log
   if [ $? != 0 ];then
     echo -e "${verm}Erro ao remover programa! Para mais informações consulte /var/log/KS_remove.log"
     sleep 2
     reset
     exit 1
   fi

   apt-get -y --force-yes autoremove | pv -W > /var/log/KS_aremove.log
   echo ""
   echo -e "${verde}$rmove removido com sucesso${NORMAL}"
   sleep 2
}
