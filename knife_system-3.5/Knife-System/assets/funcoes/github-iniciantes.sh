function github() {
  if [ -e /var/log/git1.log ];then
  if [ -e /var/log/git2.log ];then
    echo -e "${verm}Você está na pasta do projeto?[s/n]${NORMAL}"
    read gitCheck
    if [[ $gitCheck = Y || $gitCheck = y ]];then
      echo -e"${verde}OK! Então vamos continuar${NORMAL}"
      sleep 1
      echo -e "${amarelo}Adicionando todas as suas mudanças ao servidor local...${NORMAL}"
      git add .
      echo ""
      echo -e "${azul}Adicione um comentário para seu projeto:${NORMAL}"
      read gitComent
      git commit -m "$gitComent"
      echo ""
      echo -e"${verde}OK! Tudo terminado, seu projeto será lançado no github, insira seu login e senha para terminar${NORMAL}"
      git push
      if [ $? == 0 ];then
        rm /var/log/gitlog.log
        echo -e "${verde}Trabalho finalizado! Símples não.${NORMAL}"
        sleep 1
      else
        echo -e "${verm}Ops! Algo deu errado, tente novamente${NORMAL}"
        exit 1
      fi
    else
      echo -e "${verm}Você precisa estar na pasta do projeto para o script funcionar corretamente!${NORMAL}"
      sleep 1
      exit 1
    fi
  else
    echo "Segunda etapa" > /var/log/git2.log
    echo -e "${verm}Lembre-se você deve realizar o fork do projeto para o seu github${NORMAL}"
    sleep 2
    clear
    echo -e "${azul}Insira a url do projeto${branco}(ex: github.com/anony000/knife_system)${NORMAL}"
    read gitLink
    echo -e "${amarelo}Baixando o projeto para você modificar...${NORMAL}"
    git clone $gitLink
    echo ""
    echo -e "${amarelo}OK!, faça as modificações necessárias, quando terminar volte aqui${NORMAL}"
    echo -e "${amarelo}Mas lembre-se esteja na pasta do seu projeto, caso contrário nada dará certo, OK?${NORMAL}"
    echo -e "${amarelo}Até logo!${NORMAL}"
    sleep 3
  fi

else
  echo "primeira etapa" > /var/log/git1.log
  echo -e "${azul}Antes de tudo vamos configurar seu email, digite o mesmo do github${NORMAL}"
  read gitMail
  sleep 1
  echo ""
  git config --global user.email "$gitMail"
  clear
  echo -e "${azul}Agora digite seu nome de usuário${NORMAL}"
  read igtUser
  sleep 1
  echo ""
  git config --global user.name "$gitUser"
  echo ""
  echo -e "${azul}Volte aqui quando desejar iniciar ${NORMAL}"
  sleep 1
  clear
fi

}
