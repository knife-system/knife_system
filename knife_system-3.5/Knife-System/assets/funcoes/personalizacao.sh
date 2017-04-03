function aparencia() {
  function tema() {
    #### Instalar temas ####
function instTema() {
    echo -e "${ciano}Selecione a pasta onde se encontra seu tema${NORMAL}"
    echo -e "${ciano}Basta clicar em cima da pasta uma vez e em seguida em OK${NORMAL}"
    sleep 3
    theme=`zenity --file-selection --directory --confirm-overwrite --title="Selecione a pasta do tema"`

    if [ -z $theme ];then
      echo -e "${verm}Nenhum tema selecionado!${NORMAL}"
      sleep 1
      reset
      tema
    else
    clear
    mv -f $theme /usr/share/themes
    sleep 2
    echo -e "${verde}Tema adicionado com sucesso!${NORMAL}"
    sleep 1
    echo -e "${branco}O tema já está pronto para ser instalado, basta apenas${NORMAL}"
    echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
    sleep 2
  fi
  }

  #### Remover temas ######
  function rmTema () {
    echo -e "${branco}Insira o nome do tema a se removido:${NORMAL}"
    echo ""
    read rmtheme

    if [ -e /usr/share/themes/$rmtheme ];then
      sleep 2
      rm -r /usr/share/themes/$rmtheme
      echo -e "${verde}Tema removido com sucesso!"
      sleep 1
      echo -e "${azul}Basta apenas você ir em aparência e muda-lo${NORMAL}"
      sleep 2
      clear
      removeTemas
    else
      echo -e "${verm}Tema não encontrado!"
      sleep 2
      clear
      rmTema
    fi
  }

  #### Obter tema online #####
  function temaOn() {

    function temaon-arc() {
      echo -e "${ciano}Instalando tema ARC, aguarde...${NORMAL}"
      echo "deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.04/ /" >> /etc/apt/sources.list.d/arc-theme.list
      wget -q -O- http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.04/Release.key | sudo apt-key add -
      apt-get update | pv -W >/dev/null
      apt-get install -y --force-yes arc-theme | pv -W > /dev/null
      gsettings set com.canonical.desktop.interface scrollbar-mode normal
      clear
      echo -e "${branco}O tema já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    function temaon-xen() {
      echo -e "${ciano}Instalando tema Xenlism, aguarde...${NORMAL}"
      apt-key adv --keyserver keys.gnupg.net --recv-keys 90127F5B
      echo "deb http://downloads.sourceforge.net/project/xenlism-wildfire/repo deb/" | tee -a /etc/apt/sources.list
      apt-get update
      apt-get install -y --force-yes xenlism-minimalism-theme | pv -W > /dev/null
      clear
      echo -e "${branco}O tema já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    function temaon-acv() {
      echo -e "${ciano}Instalando tema Acvamarin, aguarde...${NORMAL}"
      wget https://www.dropbox.com/s/soeoqd7seivfqrr/acvamarin_1.0_all.deb?dl=0 -O Acvamarin.deb
      dpkg -i Acvamarin.deb | pv -W > /dev/null;rm Acvamarin.deb
      apt-get install -f -y --force-yes | pv -W > /dev/null
      clear
      echo -e "${branco}O tema já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }

    function temaon-swt() {
      echo -e "${ciano}Instalando tema Switch, aguarde...${NORMAL}"
      apt-add-repository ppa:numix/ppa | pv -W > /dev/null
      apt-get install -y --force-yes switch-theme | pv -W > /dev/null
      apt-get install -f -y --force-yes | pv -W > /dev/null
      clear
      echo -e "${branco}O tema já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }


    function temaon-flat() {
      echo -e "${ciano}Baixando e instalando tema Flatbulous, aguarde...${NORMAL}"
      sleep 1
      echo ""
      wget https://www.dropbox.com/s/y1mxjlyp1h25jjp/flatabulous.zip?dl=0 -O flatabulous.zip
      unzip flatabulous.zip -d /usr/share/themes;rm -rf flatbulous.zip
      echo ""
      echo -e "${verde}Tudo pronto! Basta você ir em configurações do tweak-tool e setar seu tema"
      sleep 1
    }

    echo -e "${amarelo}Obter temas online, basta selecionar e será instalado${NORMAL}"
    echo ""
    echo -e "${azul}1) ${ciano}Acvamarin${branco}(+ícone)${NORMAL}"
    echo -e "${azul}2) ${ciano}ARC${NORMAL}"
    echo -e "${azul}3) ${ciano}Xenlism${NORMAL}"
    echo -e "${azul}4) ${ciano}Switch${NORMAL}"
    echo -e "${azul}5) ${ciano}Flatbulous${NORMAL}"
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    echo -e "${verm}Escolha uma opção:${NORMAL}"
    read -n1 temaOnResp
    case $temaOnResp in
      1)reset;
        temaon-acv;
        reset;
        tema;
        ;;

        2)reset;
          temaon-arc;
          reset;
          tema;
          ;;

          3)reset;
            temaon-xen;
            reset;
            tema;
            ;;

            4)reset;
              temaon-swt;
              reset;
              tema;
              ;;

              5)reset;
                temaon-flat;
                reset;
                tema;
                ;;


                q | Q)reset;
                      aparencia;
                      ;;

                      *)reset;
                        tema;

    esac
  }
  echo -e "${ciano}             TEMAS${NORMAL}"
  echo ""
  echo -e "${verde}1) ${amarelo}Instalar temas${NORMAL}"
  echo -e "${verde}2) ${amarelo}Remover temas${NORMAL}"
  echo -e "${verde}3) ${amarelo}Temas online${NORMAL}"
  echo ""
  echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
  echo -e "${verm}Escolha uma opção:${NORMAL}"
  read -n1 temaResp
  case $temaResp in
    1)reset;
      instTema;
      reset;
      aparencia;
      ;;

      2)reset;
        rmTema;
        reset;
        aparencia;
        ;;

        3)reset;
          temaOn;
          reset;
          aparencia;
          ;;

          q | Q)reset;
                aparencia;
                ;;

                *)reset;
                  tema;
                esac
 }

  ##### Cursor ######

 function cursor() {
   ###Instalar cursor ###
   function instCur() {
   echo -e "${ciano}Selecione a pasta onde se encontra seu cursor${NORMAL}"
   echo -e "${ciano}Basta clicar em cima da pasta uma vez e em seguida em OK${NORMAL}"
   sleep 3
   curso=`zenity --file-selection --confirm-overwrite --directory title="Selecione a pasta do cursor"`

   if [ -e .icons ];then
     if [ -z $curso ];then
       echo -e "${verm}Nenhum cursor selecionado!${NORMAL}"
       sleep 1
       reset
       tema
     else
    mv $curso .icons
    sleep 2
    echo -e "${verde}Cursor adicionado com sucesso!${NORMAL}"
    sleep 1
    clear
    echo -e "${branco}O cursor já está pronto para ser instalado, basta apenas${NORMAL}"
    echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
    sleep 3
  fi
  else
    echo -e "${verm}Diretório .icons não foi encontrado em HOME${NORMAL}"
    echo -e "${ciano}Selecione a sua pasta home, basta clicar uma vez e em Ok${NORMAL}"
    sleep 3
    curHome=`zenity --file-selection --directory`
    cd $curHome
    echo ""
    echo -e "${azul}Criando diretório em sua home... "
    mkdir .icons
    sleep 2
    echo -e "${verde}Diretório criado, rode o comando novamente${NORMAL}"
    sleep 2
    clear
    cursor

  fi
 }
 ##### Remover Cursor ######

   function rmCursor() {
     echo -e "${branco}Insira o nome do cursor a ser removido:${NORMAL}"
     echo -e "${branco}Certifique-se que você esteja em sua pasta home${NORMAL}"
     echo ""
     read rmcurso

     if [ -e .icons/$rmcurso ];then
       sleep 2
       rm -r .icons/$rmcurso
       echo -e "${verde}Cursor removido com sucesso${NORMAL}"
       sleep 1
       echo -e "${branco}Basta apenas você ir em aparência e muda-lo${NORMAL}"
       sleep 2
       removeTemas
     else
       echo -e "${verm}Cursor não encontrado!${NORMAL}"
       echo -e "${branco}Certifique-se de ter digitado corretamente o nome do cursor${NORMAL}"
       echo -e "${branco}E também que você esteja em sua home${NORMAL}"
       echo -e "${ciano}Entre em sua pasta home, basta clicar uma vez nela e em OK${NORMAL}"
       sleep 7
       rmCurHome=`zenity --file-selection --directory`
       cd $rmCurHome
       reset
       rmCursor
     fi
   }
   echo -e "${ciano}             Cursor${NORMAL}"
   echo ""
   echo -e "${verde}1) ${amarelo}Instalar cursor${NORMAL}"
   echo -e "${verde}2) ${amarelo}Remover cursor${NORMAL}"
   echo ""
   echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
   echo -e "${verm}Escolha uma opção:${NORMAL}"
   read -n1 cursoResp
   case $cursoResp in
     1)reset;
       instCur;
       reset;
       aparencia;
       ;;

       2)reset;
         rmCursor;
         reset;
         aparencia;
         ;;

         q | Q) reset;
               aparencia;
               ;;

               *)reset;
                 curso;
               esac
 }

 ##### Ícones #####

  function icone() {
    function instIcon() {
    echo -e "${ciano}Selecione a pasta onde se encontra seu ícone${NORMAL}"
    echo -e "${ciano}Basta clicar em cima da pasta uma vez e em seguida em OK${NORMAL}"
    sleep 3
    icon=`zenity --file-selection --confirm-overwrite --directory --title="Selecione seu ícone"`

    if [ -z $icon ];then
      echo -e "${verm}Nenhum ícone selecionado!${NORMAL}"
      sleep 1
      reset
      tema
    else
    clear
    mv -f $icon /usr/share/icons
    sleep 2
    echo -e "${verde}Ícone adicionado com sucesso!${NORMAL}"
    sleep 1
    clear
    echo -e "${branco}O ícone já está pronto para ser instalado, basta apenas${NORMAL}"
    echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
    sleep 3
  fi
}

###### Remover ícones ######

  function rmIcones() {
    echo -e "${branco}Insira o nome do ícone a ser removido:${NORMAL}"
    echo ""
    read rmicon

    if [ -e /usr/share/icons/$rmicon ];then
      sleep 2
      rm -r /usr/share/icons/$rmicon
      echo -e "${verde}Ícone removido com sucesso!${NORMAL}"
      sleep 1
      echo -e "${branco}Basta apenas você ir em aparência e muda-lo${NORMAL}"
      sleep 2
      clear
      removeTemas
    else
      echo -e "${verm}Ícone não encontrado!${NORMAL}"
      sleep 2
      clear
      rmIcones
    fi
  }
  function iconOn() {
    function iconon-pape() {
      echo -e "${ciano}Instalando ícone Paper, aguarde...${NORMAL}"
      add-apt-repository ppa:snwh/pulp -y
      apt-get update | pv -W > /dev/null
      apt-get install -y --force-yes paper-icon-theme | pv -W > /dev/null
      clear
      echo -e "${branco}O ícone já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    function iconon-moka() {
      echo -e "${ciano}Instalando ícone Moka, aguarde...${NORMAL}"
      add-apt-repository ppa:moka/stable -y
      apt-get update | pv -W > /dev/null
      apt-get install -y --force-yes moka-icon-theme | pv -W > /dev/null
      clear
      echo -e "${branco}O ícone já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    function iconon-viva() {
      echo -e "${ciano}Instalando ícone Vivacious, aguarde...${NORMAL}"
      add-apt-repository ppa:ravefinity-project/ppa -y
      apt-get update | pv -W > /dev/null
      apt-get install -y --force-yes vivacious-colors | pv -W > /dev/null
      clear
      echo -e "${branco}O ícone já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    function iconon-spfl() {
      echo -e "${ciano}Instalando ícone Super Flat, aguarde...${NORMAL}"
      wget https://www.dropbox.com/s/630d0imj0i5q2vn/Super%20Flat%20Remix.zip?dl=0 -O SuperFlat.zip
      unzip SuperFlat.zip -d /usr/share/themes; rm SuperFlat.zip
      clear
      echo -e "${branco}O ícone já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    function iconon-acv() {
      echo -e "${ciano}Instalando ícone Acvamarin, aguarde...${NORMAL}"
      wget https://www.dropbox.com/s/soeoqd7seivfqrr/acvamarin_1.0_all.deb?dl=0 -O Acvamarin.deb
      dpkg -i Acvamarin.deb | pv -W > /dev/null;rm Acvamarin.deb
      apt-get install -f -y --force-yes | pv -W > /dev/null
      clear
      echo -e "${branco}O ícone já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    echo -e "${amarelo}Obter ícones online, basta selecionar e será instalado${NORMAL}"
    echo ""
    echo -e "${azul}1) ${ciano}Paper${NORMAL}"
    echo -e "${azul}2) ${ciano}Moka${NORMAL}"
    echo -e "${azul}3) ${ciano}Vivacious${NORMAL}"
    echo -e "${azul}4) ${ciano}Super Flat${NORMAL}"
    echo -e "${azul}5) ${ciano}Acvamarin${branco}(+tema)${NORMAL}"
    echo ""
    echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
    echo -e "${verm}Escolha uma opção:${NORMAL}"
    read -n1 temaOnResp
    case $temaOnResp in
      1)reset;
        iconon-pape;
        reset;
        icone;
        ;;

        2)reset;
          iconon-moka;
          reset;
          icone;
          ;;

          3)reset;
            iconon-viva;
            reset;
            icone;
            ;;

            4)reset;
              iconon-spfl;
              reset;
              icone;
              ;;

              5)reset;
                iconon-acv;
                reset;
                icone;
                ;;

                q | Q)reset;
                      aparencia;
                      ;;

                      *)reset;
                        tema;

    esac
  }
  echo -e "${ciano}             Ícones${NORMAL}"
  echo ""
  echo -e "${verde}1) ${amarelo}Instalar ícones${NORMAL}"
  echo -e "${verde}2) ${amarelo}Remover ícones${NORMAL}"
  echo -e "${verde}3) ${amarelo}Ícones online${NORMAL}"
  echo ""
  echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
  echo -e "${verm}Escolha uma opção:${NORMAL}"
  read -n1 temaResp
  case $temaResp in
    1)reset;
      instIcon;
      reset;
      aparencia;
      ;;

      2)reset;
        rmIcones;
        reset;
        aparencia;
        ;;

        3)reset;
          iconOn;
          reset;
          aparencia;
          ;;

          q | Q)reset;
                aparencia;
                ;;

                *)reset;
                  icone;
                esac
}
function tool() {
  echo -e "${azul}Instalando gnome-tweak-tool${NORMAL}"
  sleep 1
  echo ""
  which gnome-tweak-tool >/dev/null
  if [ $? == 0 ];then
  apt-get -y install gnome-tweak-tool | pv -W >/dev/null
else
  echo -e "${verm}Programa já instalado!${NORMAL}"
  sleep 1
fi
}

## InstalarConky
function conk() {
  function instConk() {
  echo -e "${ciano}Selecione a pasta onde se encontra seu conky${NORMAL}"
  echo -e "${ciano}Basta clicar em cima da pasta uma vez e em seguida em OK${NORMAL}"
  sleep 3
  conkyResp=`zenity --file-selection --directory --title="Selecione seu tema para o conky"`
  if [ -e .conky ];then
    if [ -z $conkyResp ];then
      echo -e "${verm}Nenhum tema para o conky selecionado!${NORMAL}"
      sleep 1
      reset
      tema
    else
      echo -e "${azul}Instalando conky...${NORMAL}"
      mv $conkyResp .conky
      sleep 1
      echo -e "${verde}Concluído!${NORMAL}"
      sleep 1
      echo -e "${branco}Para instalar definitivamente instale o Conky Manager${NORMAL}"
      echo -e "${branco}Ele pode ser encontrado para baixar na opção F) Lista de programas do script${NORMAL}"
      sleep 7
      reset
      tema
    fi
  else
    echo -e "${verm}Pasta .conky na sua pasta home não encontrada!${NORMAL}"
    echo -e "${ciano}Selecione a sua pasta home, basta clicar uma vez e em Ok${NORMAL}"
    sleep 3
    conkHome=`zenity --file-selection --directory`
    cd $conkHome
    echo -e "${azul}Criando pasta .conky em sua home${NORMAL}"
    mkdir .conky
    echo -e "${verde}Pronto!${NORMAL}"
    sleep 1
    echo -e "${ciano}Tente novamente${NORMAL}"
    sleep 1
    reset
    conk
  fi
}

##Remover conky
function rmConk() {
  echo -e "${ciano}Digite o nome do conky à ser removido${NORMAL}"
  echo -e "${branco}Levando em conta que você esteja em sua pasta home${NORMAL}"
  echo ""
  read rmConkResp
  if [ -e .conky/$rmConkResp ];then
    echo -e "${azul}Removendo tema do conky...${NORMAL}"
    rm .conky/$rmConkResp
    sleep 1
    echo -e "${verde}Concluído!${NORMAL}"
    sleep 1
    reset
    removeTemas
  else
    echo -e "${verm}Conky não encontrado!${NORMAL}"
    echo -e "${branco}Certifique-se de ter digitado corretamente o nome do conky${NORMAL}"
    echo -e "${branco}E também que você esteja em sua home${NORMAL}"
    echo -e "${ciano}Entre em sua pasta home, basta clicar uma vez nela e em OK${NORMAL}"
    sleep 7
    rmConHom=`zenity --file-selection --directory`
    cd $rmConHom
    reset
    rmConk
  fi
}
echo -e "${ciano}             Conky${NORMAL}"
echo ""
echo -e "${verde}1) ${amarelo}Instalar conky${NORMAL}"
echo -e "${verde}2) ${amarelo}Remover conky${NORMAL}"
echo ""
echo -e "${branco}Pressione [Q] para voltar${NORMAL}"
echo -e "${verm}Escolha uma opção:${NORMAL}"
read -n1 conkResp
case $conkResp in
  1)reset;
    instConk;
    reset;
    aparencia;
    ;;

    2)reset;
      rmConk;
      reset;
      aparencia;
      ;;

      q | Q) reset;
            aparencia;
            ;;

            *)reset;
              curso;
            esac
}
function temgimp() {
  echo -e "${ciano}Instalando tema do PhotoShop no gimp, aguarde...${NORMAL}"
  echo -e "${branco}by Diolinux${NORMAL}"
  sleep 2
  if [ -e .gimp* ];then
    rm -r .gimp*
    wget https://www.dropbox.com/s/prvfepg482u024u/PhotoGimp.zip?dl=0 -O PhotoGIMP.zip
    unzip PhotoGIMP.zip
    clear
    echo -e "${verde}Tema instalado, basta iniciar o GIMP${NORMAL}"
    echo -e "${branco}Em caso de problemas quanto a tela, delete o arquivo /home/usuario/.gimp/sessionrc${NORMAL}"
    sleep 2
  else
    echo -e "${verm}Pasta .gimp não encontrada!${NORMAL}"
    echo -e "${branco}Certifique-se de estar em sua home e que o gimp esteja instalado${NORMAL}"
    sleep 2
    reset
    temgimp
  fi
}

function terminal() {
function terminalInstall(){
  echo -e "${ciano}Instalando terminal personalizado com tema do ParrotSec${NORMAL}"
  sleep 1
  clear
  mv .bashrc
  mv $homeUser/.bahsrc $homeUser/.bahsrc.bak
  cp -Rf /opt/Knife-System/assets/.bashrc $homeUser
  echo -e "${verde}Terminal personalizado instalado!${NORMAL}"
  sleep 1
}

function terminalRemove() {
  check=`cat $homeUser/.bashrc | grep knifesystem`
  if [ -e $homeUser/.bashrc ];then
    if [ ${check} == "knifesystem" ];then
      echo $homeUser
      sleep 2
      echo -e "${ciano}Desinstalando terminal personalizado${NORMAL}"
      sleep 1
      mv $homeUser/.bashrc.bak $homeUser/.bashrc
      clear
      echo -e "${verde}Terminal desinstalado${NORMAL}"
      sleep 1
    else
      echo -e "${verm}Terminal personalizado não instalado${NORMAL}"
      sleep 1
    fi
  else
    echo -e "${verm}Nenhum arquivo de configuração encontrado${NORMAL}"
    sleep 1
  fi
}

function terminalImg(){
  echo -e "${ciano}Preparando sistema para instalar a imagem no terminal, aguarde...${NORMAL}"
  echo -e "${branco}Se erros forem encontrados na instalação do ImageMagick${NORMAL}"
  echo -e ${branco}Cheque se as dependências estão satisfeitas${NORMAL}
  sleep 2
  clear
  apt-get install -y w3m-img | pv -W > /dev/null
  clear
  wget https://www.imagemagick.org/download/ImageMagick.tar.gz -O /tmp/ImageMagick.tar.gz
  tar xvzf /tmp/ImageMagick.tar.gz
  cd /tmp/ImageMagick-*
  ./configure > /var/log/KS_log-ImageMagick
  if [ $? != 0 ];then
   echo -e "${verm}Erros foram encontrados ao instalar ImageMagick, cheque as dependências${NORMAL}"
   echo -e "${branco}Log's em /var/log/KS_log-ImageMagick"${NORMAL}
   sleep 3
   aparencia
  fi
  make
  make install
  ldconfig /usr/local/lib
  clear
if [ `which neofetch` == /usr/bin/neofetch ];then
  echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
  curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key
  apt-get update
  apt-get install -y neofetch | pv -W >/dev/null
fi
  clear
  if [ $? == 0 ];then
  echo -e "${verde}Tudo pronto!${NORMAL}"
  echo
  echo -e "${ciano}Selecione a imagem que deseja usar, apenas no formato PNG${NORMAL}"
  sleep 1
  terminalImgSelect=`zenity --file-selection --separator=" " --file-filter="*.png"`

  mkdir $homeUser/.config/neofetch
  echo "$neofetchConfig" > /$homeUser/.config/neofetch/config
fi
}
echo -e "${azul}1) ${amarelo}Instalar terminal${NORMAL}"
echo -e "${azul}2) ${amarelo}Desinstalar terminal${NORMAL}"
echo -e "${azul}3) ${amarelo}Inserir imagem no terminal${NORMAL}"
echo
echo -e "${branco}Pressione [ Q ] para voltar ${NORMAL}"
read -n1 terminalResp
case $terminalResp in
  1) reset;
     terminalInstall;
     reset;
     aparencia;
     ;;

      2)reset;
        terminalRemove;
        reset;
        aparencia;
        ;;

         3)reset;
           terminalImg;
           reset;
           aparencia;
           ;;

        *) reset;
           terminal;
  esac

}
  echo -e "${amarelo}1) ${azul} Temas${NORMAL}"
  echo -e "${amarelo}2) ${azul} Cursores${NORMAL}"
  echo -e "${amarelo}3) ${azul} Ícones${NORMAL}"
  echo -e "${amarelo}4) ${azul} Conky${NORMAL}"
  echo -e "${amarelo}5) ${azul} Terminal${NORMAL}"
  echo -e "${amarelo}6) ${azul} Gnome-Tweak-Tool${NORMAL}"
  echo -e "${amarelo}7) ${azul} PhotoGimp${branco}(extra)${NORMAL}"
  echo ""
  echo -e "${azul}X) ${amarelo}Voltar ao menu principal${NORMAL}"
  read -n1 temeInsta

  while [ temeInsta != '' ]
  do
    case $temeInsta in

      1) reset;
         tema;
         reset;
         aparencia;
         ;;

         2) reset;
            cursor;
            reset;
            aparencia;
            ;;

            3) reset;
               icone;
               reset;
               aparencia;
               ;;

               4)reset;
                 conk;
                 reset;
                 aparencia;
                 ;;

              5)reset;
                terminal;
                reset;
                aparencia;
                ;;

               6) reset;
                  tool;
                  reset;
                  aparencia;
                  ;;

                  7)reset;
                    temgimp;
                    reset;
                    aparencia;
                    ;;

                  x) fazer;
                     ;;

                     *)reset;
                       aparencia;
                       ;;
    esac
done
}
