function reparar-pacotes-sistema() {
  echo -e $ciano "Reparando erros de dependencias... Isso pode demorar um pouco"$NORMAL
  apt-get -f -y --force-yes install | pv -W 2> $pastaLogs/$horarioAtual-debug.log
  apt-get -y --force-yes autoremove | pv -W 2> $pastaLogs/$horarioAtual-debug.log
  apt-get clean | pv -W 2> $pastaLogs/$horarioAtual-debug.log
  dpkg --configure -a | pv -W 2> $pastaLogs/$horarioAtual-debug.log
  clear
  sleep 1
  echo -e $ciano "Trecho de código desenvolvido Black Hat Sec e traduzido por Anônimo000"
  sleep 1
  echo -e $verm"########################################################"$NORMAL;
  sleep 0.1
  echo -e $verde"           Black Hat Sec Presents :"$NORMAL;
  sleep 0.1
  echo -e $verm"########################################################"$NORMAL;
  sleep 0.1
  echo -e $verde"                 by D4RkNiK4s                          "$NORMAL;
  sleep 0.1
  echo -e $amarelo"    All rights reserved to Black Hat Sec."$ENDCOLOR;
  sleep 0.1
  echo -e $azul"           http://blackhatsec.org "$NORMAL;
  sleep 0.1
  echo -e $verm"########################################################"$NORMAL;
  sleep 0.5
  echo -e $amarelo"[SFAGEAS]:Limpando var/tmp..."$NORMAL
  sleep 0.5
  cd /var/tmp/
  sleep 0.5
  rm -fr /var/tmp/* --force
  clear
  echo -e $amarelo"[SFAGEAS]:Limpando /var/log/..."$NORMAL
  rm -rf /var/log/* -f
  rm -rf /var/cache/* -f
  echo ""
  echo -e $amarelo"[SFAGEAS]:Limpando /var/cache/..."$NORMAL
  echo ""
  sleep 0.5
  sudo rm -rf ~/root/.local/share/Trash/*
  sleep 0.5
  echo ""
  echo ""
  sleep 0.5
  cd ..
  sleep 0.5
  echo ""
  echo -e $amarelo"[SFAGEAS]:Limpando kernels antigos..."$NORMAL
  sudo aptitude purge $OLDKERNELS | pv -W 2> $pastaLogs/$horarioAtual-debug.log
  sleep 0.5
  echo ""
  echo -e $amarelo"[SFAGEAS]:Corrigindo pacotes quebrados..."$NORMAL
  sudo apt-get check | pv -W 2> $pastaLogs/$horarioAtual-debug.log ; sudo apt-get -f install | pv -W 2> $pastaLogs/$horarioAtual-debug.log
  sleep 0.5
  echo -e $amarelo"[SFAGEAS]:Limpando arquivos da lixeira..."$NORMAL
  sleep 0.5
  rm -rf /home/*/.local/share/Trash/*/** 2> $pastaLogs/$horarioAtual-debug.log
  sleep 0.5
  rm -rf /root/.local/share/Trash/*/** 2> $pastaLogs/$horarioAtual-debug.log
  sleep 0.5
  sudo aptitude clean | pv -W 2> $pastaLogs/$horarioAtual-debug.log
  sleep 0.5
  sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get purge && sudo apt-get clean | pv -W > $pastaLogs/$horarioAtual-debug.log
  sleep 0.5
  echo ""
  echo ""
  echo -e $amarelo"[SFAGEAS]:Limpando configurações extras..."$NORMAL
  sudo aptitude purge $OLDCONF | pv -W 2> $pastaLogs/$horarioAtual-debug.log
  dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge | pv -W 2> $pastaLogs/$horarioAtual-debug.log
  sleep 0.5
  echo ""
  echo ""
  echo -e $amarelo"[SFAGEAS]:Limpando cache do apt novamente..."$NORMAL
  sudo aptitude clean | pv -W 2> $pastaLogs/$horarioAtual-debug.log
  sleep 0.5
  echo ""
  echo ""
  echo -e $amarelo"[SFAGEAS]:Removendo arquivos de configuração antigos novamente..."$NORMAL
  sudo aptitude purge $OLDCONF
  sleep 0.5
  apt-get autoremove | pv -W 2> /var/log/KS_autremove.log
  sleep 0.5
  apt-get clean | pv -W 2> $pastaLogs/$horarioAtual-debug.log
  sleep 0.5
  echo -e $amarelo"[SFAGEAS]:Esvaziando lixeira..."$NORMAL

  echo ""
  echo ""
  rm -rf /home/*/.local/share/Trash/*/** 2> $pastaLogs/$horarioAtual-debug.log
  rm -rf /root/.local/share/Trash/*/** 2> $pastaLogs/$horarioAtual-debug.log
  echo ""
  clear
  echo -e $verm"###############################################"$NORMAL
  echo -e $verm"#               <<SFAGEAS>>                   #"$NORMAL
  echo -e $verm"#              Trabalho finalizado!!          #"$NORMAL
  echo -e $verm"###############################################"$NORMAL
  echo ""
  echo "Tenha um bom dia!"
  echo ""
  echo "Feito por D4RkNik0l4s, editado e traduzido por Anônimo000"
}
