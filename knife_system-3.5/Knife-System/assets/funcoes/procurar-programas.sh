function encontrar-programas() {
   echo -e $verm"#############################################${NORMAL}"
   echo -e "                   ${verde}Procurar               ${NORMAL}"
   echo -e $verm"#############################################${NORMAL}"
   echo ""
   echo -e $amarelo"Digite o nome do programa:${NORMAL}"
   read programaPesquisado
   echo -e $ciano""
   apt-cache pkgnames $programaPesquisado | grep $programaPesquisado
   echo ""
   echo -e "${branco}Pressione [ Q ] para voltar${NORMAL}"
   echo ""
   echo -e "${amarelo}Pressione ${verde}[ N ] ${amarelo}para uma nova busca${NORMAL}"
   read -n1 voltarAcharPrograma

   case $voltarAcharPrograma in

     Q | q)fazer;
           ;;

           n | N)reset;
                 encontrar-programas;
                 ;;
      *)reset;
        encontrar-programas;
    esac

}
