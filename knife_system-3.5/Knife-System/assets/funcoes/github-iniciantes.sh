function github-ajuda-iniciantes() {
  
  # Verifica se a pasta de logs existe
  if [ -e $pastaLogs/github-iniciantes ];then
            echo "" > /dev/null
  else 
            mkdir $pastaLogs/github-iniciantes
  fi
  
  # Adiciona a pasta de logs a uma variável
  pastaGithubLogs=${pastaLogs}/github-iniciantes

  # Os IF's abaixo verificam em qual etapa o usuário se encontra
  # Primeira etapa: Configurar email e nome 
  # Segunda etapa: realizar o clone do projeto

  if [ -e $pastaGithubLogs/git-1-etapa.log ];then
  if [ -e $pastaGithubLogs/git-2-etapa.log ];then

    if [ -e .git ];then
      echo -e "${ciano}Adicionando todas as suas mudanças ao servidor local...${NORMAL}"
      git add --all
      echo ""
      echo -e "${ciano}Adicione um comentário para seu projeto:${NORMAL}"
      read gitCommitMensagem
      git commit -m "$gitCommitMensagem"
      echo ""
      echo -e"${verde}OK! Tudo terminado, seu projeto será lançado no github, insira seu login e senha para terminar${NORMAL}"
      git push origin master

      if [ $? == 0 ];then
        echo -e "${verde}Trabalho finalizado! Símples não.${NORMAL}"
        sleep 1
      else
        echo -e "${verm}Ops! Algo deu errado, tente novamente${NORMAL}"
        exit 1
      fi

    else
      echo -e "${verm}Você precisa entrar na pasta onde o arquivo .git está localizado${NORMAL}"
      sleep 1
      exit 1
    fi
  else
    echo "Segunda etapa" > $pastaGithubLogs/git-2-etapa.log
    echo -e "${ciano}Lembre-se você deve realizar o fork do projeto para o seu github${NORMAL}"
    sleep 2
    clear
    echo -e "${ciano}Insira a url do projeto${branco}(ex: github.com/anony000/knife_system)${NORMAL}"
    read githubProjetoLink
    echo -e "${ciano}Baixando o projeto para você modificar...${NORMAL}"
    git clone $githubProjetoLink

    # Expressão regular para obter a pasta na qual foi baixado o projeto
    diretorioGithubProjeto=`echo ${githubProjetoLink} | cut -d / -f 5`

    cd $diretorioGithubProjeto
    sleep 2
  fi

else
  echo "primeira etapa" > $pastaGithubLogs/git-1-etapa.log
  echo -e "${azul}Antes de tudo vamos configurar seu email, digite o mesmo do github${NORMAL}"
  read gitConfigurarEmail
  sleep 1
  echo ""
  git config --global user.email "$gitConfigurarEmail"
  clear
  echo -e "${azul}Agora digite seu nome de usuário${NORMAL}"
  read gitConfigurarNome
  sleep 1
  echo ""
  git config --global user.name "$gitConfigurarNome"
  echo ""
  echo -e "${azul}Acesse a função github para iniciantes novamente, para podermos continuar${NORMAL}"
  sleep 1
  clear
fi

}
