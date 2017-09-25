function aparencia() {
function opcoes-tema() {
function instalar-tema() {
    echo -e "${ciano}Selecione a pasta onde se encontra seu tema${NORMAL}"
    echo -e "${branco}Basta clicar em cima da pasta uma vez e em seguida em OK${NORMAL}"
    sleep 3
    PastaTemaEscolhido=`zenity --file-selection --directory --confirm-overwrite --title="Selecione a pasta do tema"`

    if [ -z $PastaTemaEscolhido ];then
      echo -e "${verm}Nenhum tema selecionado!${NORMAL}"
      sleep 1
      reset
      opcoes-tema
    else
    clear
    mv -f $PastaTemaEscolhido /usr/share/themes
    sleep 2
    echo -e "${verde}Tema adicionado com sucesso!${NORMAL}"
    sleep 1
    echo -e "${branco}O tema já está pronto para ser instalado, basta apenas${NORMAL}"
    echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
    sleep 2
  fi
  }

  #### Remover temas ######
  function remover-tema () {
    echo -e "${branco}Insira o nome do tema a se removido:${NORMAL}"
    echo ""
    read temaRemovido

    if [ -e /usr/share/themes/$temaRemovido ];then
      sleep 2
      rm -r /usr/share/themes/$temaRemovido
      echo -e "${verde}Tema removido com sucesso!"
      sleep 1
      echo -e "${azul}Basta apenas você ir em aparência e muda-lo${NORMAL}"
      sleep 1
      clear
      remover-tema
    else
      echo -e "${verm}Tema não encontrado!"
      sleep 2
      clear
      remover-tema
    fi
  }

  #### Obter tema online #####
  function temas-onlines() {

    function tema-online-arc() {
      echo -e "${ciano}Instalando tema ARC, aguarde...${NORMAL}"
      echo "deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.04/ /" >> /etc/apt/sources.list.d/arc-theme.list
      wget -q -O- http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.04/Release.key | sudo apt-key add -
      apt-get update | pv -W > $pastaLogs/$horarioAtual-debug.log
      apt-get install -y --force-yes arc-theme | pv -W > $pastaLogs/$horarioAtual-debug.log
      gsettings set com.canonical.desktop.interface scrollbar-mode normal
      clear
      echo -e "${branco}O tema já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    function tema-online-xen() {
      echo -e "${ciano}Instalando tema Xenlism, aguarde...${NORMAL}"
      apt-key adv --keyserver keys.gnupg.net --recv-keys 90127F5B
      echo "deb http://downloads.sourceforge.net/project/xenlism-wildfire/repo deb/" | tee -a /etc/apt/sources.list
      apt-get update
      apt-get install -y --force-yes xenlism-minimalism-theme | pv -W > $pastaLogs/$horarioAtual-debug.log
      clear
      echo -e "${branco}O tema já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    function tema-online-acv() {
      echo -e "${ciano}Instalando tema Acvamarin, aguarde...${NORMAL}"
      wget https://www.dropbox.com/s/soeoqd7seivfqrr/acvamarin_1.0_all.deb?dl=0 -O Acvamarin.deb
      dpkg -i Acvamarin.deb | pv -W > $pastaLogs/$horarioAtual-debug.log;rm Acvamarin.deb
      apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
      clear
      echo -e "${branco}O tema já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }

    function tema-online-swt() {
      echo -e "${ciano}Instalando tema Switch, aguarde...${NORMAL}"
      apt-add-repository ppa:numix/ppa | pv -W > $pastaLogs/$horarioAtual-debug.log
      apt-get install -y --force-yes switch-theme | pv -W > $pastaLogs/$horarioAtual-debug.log
      apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
      clear
      echo -e "${branco}O tema já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }


    function tema-online-flat() {
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
        tema-online-acv;
        reset;
        opcoes-tema;
        ;;

        2)reset;
          tema-online-arc;
          reset;
          opcoes-tema;
          ;;

          3)reset;
            tema-online-xen;
            reset;
            opcoes-tema;
            ;;

            4)reset;
              tema-online-swt;
              reset;
              opcoes-tema;
              ;;

              5)reset;
                tema-online-flat;
                reset;
                opcoes-tema;
                ;;


                q | Q)reset;
                      aparencia;
                      ;;

                      *)reset;
                        opcoes-tema;

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
      instalar-tema;
      reset;
      aparencia;
      ;;

      2)reset;
        remover-tema;
        reset;
        aparencia;
        ;;

        3)reset;
          temas-onlines;
          reset;
          aparencia;
          ;;

          q | Q)reset;
                aparencia;
                ;;

                *)reset;
                  opcoes-tema;
                esac
 }

  ##### Cursor ######

 function opcoes-cursor() {
   ###Instalar cursor ###
   function instalar-cursor() {
   echo -e "${ciano}Selecione a pasta onde se encontra seu cursor${NORMAL}"
   echo -e "${ciano}Basta clicar em cima da pasta uma vez e em seguida em OK${NORMAL}"
   sleep 3
   curso=`zenity --file-selection --confirm-overwrite --directory title="Selecione a pasta do cursor"`

   if [ -e .icons ];then
     if [ -z $curso ];then
       echo -e "${verm}Nenhum cursor selecionado!${NORMAL}"
       sleep 1
       reset
       opcoes-tema
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
    opcoes-cursor

  fi
 }
 ##### Remover Cursor ######

   function remover-cursor() {
     echo -e "${branco}Insira o nome do cursor a ser removido:${NORMAL}"
     echo -e "${branco}Certifique-se que você esteja em sua pasta home${NORMAL}"
     echo ""
     read cursorRemovido

     if [ -e .icons/$cursorRemovido ];then
       sleep 2
       rm -r .icons/$cursorRemovido
       echo -e "${verde}Cursor removido com sucesso${NORMAL}"
       sleep 1
       echo -e "${branco}Basta apenas você ir em aparência e muda-lo${NORMAL}"
       sleep 2
       aparencia
     else
       echo -e "${verm}Cursor não encontrado!${NORMAL}"
       echo -e "${branco}Certifique-se de ter digitado corretamente o nome do cursor${NORMAL}"
       echo -e "${branco}E também que você esteja em sua home${NORMAL}"
       echo -e "${ciano}Entre em sua pasta home, basta clicar uma vez nela e em OK${NORMAL}"
       sleep 7
       pastaCursorRemovido=`zenity --file-selection --directory`
       cd $pastaCursorRemovido
       reset
       remover-cursor
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
       instalar-cursor;
       reset;
       aparencia;
       ;;

       2)reset;
         remover-cursor;
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

  function opcoes-icone() {
    function instalar-icone() {
    echo -e "${ciano}Selecione a pasta onde se encontra seu ícone${NORMAL}"
    echo -e "${ciano}Basta clicar em cima da pasta uma vez e em seguida em OK${NORMAL}"
    sleep 3
    iconeInstalarSelecionado=`zenity --file-selection --confirm-overwrite --directory --title="Selecione seu ícone"`

    if [ -z $iconeInstalarSelecionado ];then
      echo -e "${verm}Nenhum ícone selecionado!${NORMAL}"
      sleep 1
      reset
      opcoes-tema
    else
    clear
    mv -f $iconeInstalarSelecionado /usr/share/icons
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

  function remover-icones() {
    echo -e "${branco}Insira o nome do ícone a ser removido:${NORMAL}"
    echo ""
    read iconeRemovidoSelecionado

    if [ -e /usr/share/icons/$iconeRemovidoSelecionado ];then
      sleep 2
      rm -r /usr/share/icons/$iconeRemovidoSelecionado
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
      remover-icones
    fi
  }
  function icones-online() {
    function icone-online-paper() {
      echo -e "${ciano}Instalando ícone Paper, aguarde...${NORMAL}"
      add-apt-repository ppa:snwh/pulp -y
      apt-get update | pv -W > $pastaLogs/$horarioAtual-debug.log
      apt-get install -y --force-yes paper-icone-theme | pv -W > $pastaLogs/$horarioAtual-debug.log
      clear
      echo -e "${verde}O ícone já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${verde}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    function icone-online-moka() {
      echo -e "${ciano}Instalando ícone Moka, aguarde...${NORMAL}"
      add-apt-repository ppa:moka/stable -y
      apt-get update | pv -W > $pastaLogs/$horarioAtual-debug.log
      apt-get install -y --force-yes moka-iconeInstalarSelecionado-theme | pv -W > $pastaLogs/$horarioAtual-debug.log
      clear
      echo -e "${branco}O ícone já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    function icone-online-vivacious() {
      echo -e "${ciano}Instalando ícone Vivacious, aguarde...${NORMAL}"
      add-apt-repository ppa:ravefinity-project/ppa -y
      apt-get update | pv -W > $pastaLogs/$horarioAtual-debug.log
      apt-get install -y --force-yes vivacious-colors | pv -W > $pastaLogs/$horarioAtual-debug.log
      clear
      echo -e "${branco}O ícone já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    function icone-online-super-flat() {
      echo -e "${ciano}Instalando ícone Super Flat, aguarde...${NORMAL}"
      wget https://www.dropbox.com/s/630d0imj0i5q2vn/Super%20Flat%20Remix.zip?dl=0 -O SuperFlat.zip
      unzip SuperFlat.zip -d /usr/share/themes; rm SuperFlat.zip
      clear
      echo -e "${branco}O ícone já está pronto para ser instalado, basta apenas${NORMAL}"
      echo -e "${branco}você ir nas configurações e muda-lo${NORMAL}"
      sleep 3
    }
    function icone-online-acvamarin() {
      echo -e "${ciano}Instalando ícone Acvamarin, aguarde...${NORMAL}"
      wget https://www.dropbox.com/s/soeoqd7seivfqrr/acvamarin_1.0_all.deb?dl=0 -O Acvamarin.deb
      dpkg -i Acvamarin.deb | pv -W > $pastaLogs/$horarioAtual-debug.log;rm Acvamarin.deb
      apt-get install -f -y --force-yes | pv -W > $pastaLogs/$horarioAtual-debug.log
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
        icone-online-paper;
        reset;
        opcoes-icone;
        ;;

        2)reset;
          icone-online-moka;
          reset;
          opcoes-icone;
          ;;

          3)reset;
            icone-online-vivacious;
            reset;
            opcoes-icone;
            ;;

            4)reset;
              icone-online-super-flat;
              reset;
              opcoes-icone;
              ;;

              5)reset;
                icone-online-acvamarin;
                reset;
                opcoes-icone;
                ;;

                q | Q)reset;
                      aparencia;
                      ;;

                      *)reset;
                        opcoes-tema;

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
      instalar-icone;
      reset;
      aparencia;
      ;;

      2)reset;
        remover-icones;
        reset;
        aparencia;
        ;;

        3)reset;
          icones-online;
          reset;
          aparencia;
          ;;

          q | Q)reset;
                aparencia;
                ;;

                *)reset;
                  opcoes-icone;
                esac
}

## InstalarConky
function opcoes-conky() {
  function instalar-conky() {
  echo -e "${ciano}Selecione a pasta onde se encontra seu conky${NORMAL}"
  echo -e "${ciano}Basta clicar em cima da pasta uma vez e em seguida em OK${NORMAL}"
  sleep 3
  conkyInstalarSelecionado=`zenity --file-selection --directory --title="Selecione seu tema para o conky"`
  if [ -e .conky ];then
    if [ -z $conkyInstalarSelecionado ];then
      echo -e "${verm}Nenhum tema para o conky selecionado!${NORMAL}"
      sleep 1
      reset
      opcoes-tema
    else
      echo -e "${azul}Instalando conky...${NORMAL}"
      mv $conkyInstalarSelecionado .conky
      sleep 1
      echo -e "${verde}Concluído!${NORMAL}"
      sleep 1
      echo -e "${branco}Para instalar definitivamente instale o Conky Manager${NORMAL}"
      echo -e "${branco}Ele pode ser encontrado para baixar na opção F) Lista de programas do script${NORMAL}"
      sleep 7
      reset
      opcoes-tema
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
    opcoes-conky
  fi
}

##Remover conky
function remover-conky() {
  echo -e "${ciano}Digite o nome do conky à ser removido${NORMAL}"
  echo -e "${branco}Levando em conta que você esteja em sua pasta home${NORMAL}"
  echo ""
  read conkyRemoverSelecionado
  if [ -e .conky/$conkyRemoverSelecionado ];then
    echo -e "${azul}Removendo tema do conky...${NORMAL}"
    rm .conky/$conkyRemoverSelecionado
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
    remover-conky
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
    instalar-conky;
    reset;
    aparencia;
    ;;

    2)reset;
      remover-conky;
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
function tema-gimp-diolinux() {
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
    tema-gimp-diolinux
  fi
}

function opcoes-terminal() {
function terminalInstall(){
  echo -e "${ciano}Instalando terminal personalizado com tema do ParrotSec${NORMAL}"
  sleep 1
  clear
  mv $homeUser/.bahsrc $homeUser/.bahsrc.bak
  cp -Rf /opt/Knife-System/assets/.bashrc $homeUser
  echo -e "${verde}Terminal personalizado instalado!${NORMAL}"
  sleep 1
}

function remover-terminal() {
  checarBashrc=`cat $homeUser/.bashrc | grep knifesystem`
  if [ -e $homeUser/.bashrc ];then
    if [ $checarBashrc == "knifesystem" ];then
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

function setar-imagem-terminal(){
  neofetchVersao=`neofetch --version | grep Neofetch | cut -d' ' -f 2`
  echo -e "${ciano}Preparando sistema para instalar a imagem no terminal, aguarde...${NORMAL}"
  echo -e ${branco}Cheque se as dependências estão satisfeitas${NORMAL}
  sleep 2
  clear
if [ `which neofetch` != /usr/bin/neofetch ];then
  apt-get install -y imagemagick w3m-img | pv -W > $pastaLogs/$horarioAtual-debug.log
  echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
  curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key
  apt-get update
  apt-get install -y neofetch | pv -W > $pastaLogs/$horarioAtual-debug.log
fi
  clear
  echo -e "${verde}Tudo pronto!${NORMAL}"
  echo
  echo -e "${ciano}Selecione a imagem que deseja usar, apenas no formato PNG${NORMAL}"
  sleep 1
  terminalImgSelect=`zenity --file-selection --separator=" " --file-filter="*.png"`

  mkdir ~/.config/neofetch
  echo "
  #!/usr/bin/env bash
#
# Neofetch config file
# https://github.com/dylanaraps/neofetch


# See this wiki page for more info:
# https://github.com/dylanaraps/neofetch/wiki/Customizing-Info
print_info() {
    info title
    info underline

    info "OS" distro
    info "Model" model
    info "Kernel" kernel
    info "Uptime" uptime
    info "Packages" packages
    info "Shell" shell
    info "Resolution" resolution
    info "DE" de
    info "WM" wm
    info "WM Theme" wm_theme
    info "Theme" theme
    info "Icons" icons
    info "Terminal" term
    info "Terminal Font" term_font
    info "CPU" cpu
    info "GPU" gpu
    info "Memory" memory

    # info "CPU Usage" cpu_usage
    # info "Disk" disk
    # info "Battery" battery
    # info "Font" font
    # info "Song" song
    # info "Local IP" local_ip
    # info "Public IP" public_ip
    # info "Users" users
    # info "Install Date" install_date
    # info "Locale" locale # This only works on glibc systems.

    info line_break
    info cols
    info line_break
}


# Kernel


# Shorten the output of the kernel function.
#
# Default:  'on'
# Values:   'on', 'off'
# Flag:     --kernel_shorthand
# Supports: Everything except *BSDs (except PacBSD and PC-BSD)
#
# Example:
# on:  '4.8.9-1-ARCH'
# off: 'Linux 4.8.9-1-ARCH'
kernel_shorthand="on"


# Distro


# Shorten the output of the distro function
#
# Default:  'off'
# Values:   'on', 'off', 'tiny'
# Flag:     --distro_shorthand
# Supports: Everything except Windows and Haiku
distro_shorthand="off"

# Show/Hide OS Architecture.
# Show 'x86_64', 'x86' and etc in 'Distro:' output.
#
# Default: 'on'
# Values:  'on', 'off'
# Flag:    --os_arch
#
# Example:
# on:  'Arch Linux x86_64'
# off: 'Arch Linux'
os_arch="on"


# Uptime


# Shorten the output of the uptime function
#
# Default: 'on'
# Values:  'on', 'off', 'tiny'
# Flag:    --uptime_shorthand
#
# Example:
# on:   '2 days, 10 hours, 3 mins'
# off:  '2 days, 10 hours, 3 minutes'
# tiny: '2d 10h 3m'
uptime_shorthand="on"


# Shell


# Show the path to $SHELL
#
# Default: 'off'
# Values:  'on', 'off'
# Flag:    --shell_path
#
# Example:
# on:  '/bin/bash'
# off: 'bash'
shell_path="off"

# Show $SHELL version
#
# Default: 'on'
# Values:  'on', 'off'
# Flag:    --shell_version
#
# Example:
# on:  'bash 4.4.5'
# off: 'bash'
shell_version="on"


# CPU


# CPU speed type
#
# Default: 'bios_limit'
# Values: 'scaling_cur_freq', 'scaling_min_freq', 'scaling_max_freq', 'bios_limit'.
# Flag:    --speed_type
# Supports: Linux with 'cpufreq'
# NOTE: Any file in '/sys/devices/system/cpu/cpu0/cpufreq' can be used as a value.
speed_type="bios_limit"

# CPU speed shorthand
#
# Default: 'off'
# Values: 'on', 'off'.
# Flag:    --speed_shorthand.
#
# Example:
# on:    'i7-6500U (4) @ 3.1GHz'
# off:   'i7-6500U (4) @ 3.100GHz'
speed_shorthand="off"

# Shorten the output of the CPU function
#
# Default: 'off'
# Values:  'on', 'off', 'tiny', 'name', 'speed'
# Flag:    --cpu_shorthand
#
# Example:
# on:    'i7-6500U (4) @ 3.1GHz'
# off:   'Intel i7-6500U (4) @ 3.1GHz'
# tiny:  'i7-6500U (4)'
# name:  'Intel i7-6500U (4)'
# speed: '3.1GHz'
cpu_shorthand="off"

# CPU Speed
# Hide/Show CPU speed.
#
# Default: 'on'
# Values:  'on', 'off'
# Flag:    --cpu_speed
#
# Example:
# on:  'Intel i7-6500U (4) @ 3.1GHz'
# off: 'Intel i7-6500U (4)'
cpu_speed="on"

# CPU Cores
# Display CPU cores in output
#
# Default: 'logical'
# Values:  'logical', 'physical', 'off'
# Flag:    --cpu_cores
# Support: 'physical' doesn't work on BSD.
#
# Example:
# logical:  'Intel i7-6500U (4) @ 3.1GHz' (All virtual cores)
# physical: 'Intel i7-6500U (2) @ 3.1GHz' (All physical cores)
# off:      'Intel i7-6500U @ 3.1GHz'
cpu_cores="logical"

# CPU Temperature
# Hide/Show CPU temperature.
# Note the temperature is added to the regular CPU function.
#
# Default: 'off'
# Values:  'C', 'F', 'off'
# Flag:    --cpu_temp
# Supports: Linux
#
# Example:
# C:   'Intel i7-6500U (4) @ 3.1GHz [27.2°C]'
# F:   'Intel i7-6500U (4) @ 3.1GHz [82.0°F]'
# off: 'Intel i7-6500U (4) @ 3.1GHz'
cpu_temp="off"


# GPU


# Enable/Disable GPU Brand
#
# Default: 'on'
# Values:  'on', 'off'
# Flag:    --gpu_brand
#
# Example:
# on:  'AMD HD 7950'
# off: 'HD 7950'
gpu_brand="on"

# Which GPU to display
#
# Default: 'all'
# Values:  'all', 'dedicated', 'integrated'
# Flag:    --gpu_type
# Supports: Linux
#
# Example:
# all:
#   GPU1: AMD HD 7950
#   GPU2: Intel Integrated Graphics
#
# dedicated:
#   GPU1: AMD HD 7950
#
# integrated:
#   GPU1: Intel Integrated Graphics
gpu_type="all"


# Resolution


# Display refresh rate next to each monitor
# Default: 'off'
# Values:  'on', 'off'
# Flag:    --refresh_rate
# Supports: Doesn't work on Windows.
#
# Example:
# on:  '1920x1080 @ 60Hz'
# off: '1920x1080'
refresh_rate="off"


# Gtk Theme / Icons / Font


# Shorten output of GTK Theme / Icons / Font
#
# Default: 'off'
# Values:  'on', 'off'
# Flag:    --gtk_shorthand
#
# Example:
# on:  'Numix, Adwaita'
# off: 'Numix [GTK2], Adwaita [GTK3]'
gtk_shorthand="off"


# Enable/Disable gtk2 Theme / Icons / Font
#
# Default: 'on'
# Values:  'on', 'off'
# Flag:    --gtk2
#
# Example:
# on:  'Numix [GTK2], Adwaita [GTK3]'
# off: 'Adwaita [GTK3]'
gtk2="on"

# Enable/Disable gtk3 Theme / Icons / Font
#
# Default: 'on'
# Values:  'on', 'off'
# Flag:    --gtk3
#
# Example:
# on:  'Numix [GTK2], Adwaita [GTK3]'
# off: 'Numix [GTK2]'
gtk3="on"


# IP Address


# Website to ping for the public IP
#
# Default: 'http://ident.me'
# Values:  'url'
# Flag:    --ip_host
public_ip_host="http://ident.me"


# Disk


# Which disks to display.
# The values can be any /dev/sdXX, mount point or directory.
# NOTE: By default we only show the disk info for '/'.
#
# Default: '/'
# Values:  '/', '/dev/sdXX', '/path/to/drive'.
# Flag:    --disk_show
#
# Example:
# disk_show=('/' '/dev/sdb1'):
#      'Disk (/): 74G / 118G (66%)'
#      'Disk (/mnt/Videos): 823G / 893G (93%)'
#
# disk_show=('/'):
#      'Disk (/): 74G / 118G (66%)'
#
disk_show=('/')

# Disk subtitle.
# What to append to the Disk subtitle.
#
# Default: 'mount'
# Values:  'mount', 'name', 'dir'
# Flag:    --disk_subtitle
#
# Example:
# name:   'Disk (/dev/sda1): 74G / 118G (66%)'
#         'Disk (/dev/sdb2): 74G / 118G (66%)'
#
# mount:  'Disk (/): 74G / 118G (66%)'
#         'Disk (/mnt/Local Disk): 74G / 118G (66%)'
#         'Disk (/mnt/Videos): 74G / 118G (66%)'
#
# dir:    'Disk (/): 74G / 118G (66%)'
#         'Disk (Local Disk): 74G / 118G (66%)'
#         'Disk (Videos): 74G / 118G (66%)'
disk_subtitle="mount"


# Song


# Print the Artist and Title on separate lines
#
# Default: 'off'
# Values:  'on', 'off'
# Flag:    --song_shorthand
#
# Example:
# on:  'Artist: The Fratellis'
#      'Song: Chelsea Dagger'
#
# off: 'Song: The Fratellis - Chelsea Dagger'
song_shorthand="off"


# Install Date


# Whether to show the time in the output
#
# Default:  'on'
# Values:   'on', 'off'
# Flag:     --install_time
#
# Example:
# on:  'Thu 14 Apr 2016 11:50 PM'
# off: 'Thu 14 Apr 2016'
install_time="on"

# Set time format in the output
#
# Default: '24h'
# Values:  '12h', '24h'
# Flag:    --install_time_format
#
# Example:
# 12h: 'Thu 14 Apr 2016 11:50 PM'
# 24h: 'Thu 14 Apr 2016 23:50'
install_time_format="12h"


# Text Colors


# Text Colors
#
# Default:  'distro'
# Values:   'distro', 'num' 'num' 'num' 'num' 'num' 'num'
# Flag:     --colors
#
# Each number represents a different part of the text in
# this order: 'title', '@', 'underline', 'subtitle', 'colon', 'info'
#
# Example:
# colors=(distro)      - Text is colored based on Distro colors.
# colors=(4 6 1 8 8 6) - Text is colored in the order above.
colors=(distro)


# Text Options


# Toggle bold text
#
# Default:  'on'
# Values:   'on', 'off'
# Flag:     --bold
bold="on"

# Enable/Disable Underline
#
# Default:  'on'
# Values:   'on', 'off'
# Flag:     --underline
underline_enabled="on"

# Underline character
#
# Default:  '-'
# Values:   'string'
# Flag:     --underline_char
underline_char="-"


# Color Blocks


# Color block range
# The range of colors to print.
#
# Default:  '0', '7'
# Values:   'num'
# Flag:     --block_range
#
# Example:
#
# Display colors 0-7 in the blocks.  (8 colors)
# neofetch --block_range 0 7
#
# Display colors 0-15 in the blocks. (16 colors)
# neofetch --block_range 0 15
block_range=(0 7)

# Toggle color blocks
#
# Default:  'on'
# Values:   'on', 'off'
# Flag:     --color_blocks
color_blocks="on"

# Color block width in spaces
#
# Default:  '3'
# Values:   'num'
# Flag:     --block_width
block_width=3

# Color block height in lines
#
# Default:  '1'
# Values:   'num'
# Flag:     --block_height
block_height=1


# Progress Bars


# Bar characters
#
# Default:  '-', '='
# Values:   'string', 'string'
# Flag:     --bar_char
#
# Example:
# neofetch --bar_char 'elapsed' 'total'
# neofetch --bar_char '-' '='
bar_char_elapsed="-"
bar_char_total="="

# Toggle Bar border
#
# Default:  'on'
# Values:   'on', 'off'
# Flag:     --bar_border
bar_border="on"

# Progress bar length in spaces
# Number of chars long to make the progress bars.
#
# Default:  '15'
# Values:   'num'
# Flag:     --bar_length
bar_length=15

# Progress bar colors
# When set to distro, uses your distro's logo colors.
#
# Default:  'distro', 'distro'
# Values:   'distro', 'num'
# Flag:     --bar_colors
#
# Example:
# neofetch --bar_colors 3 4
# neofetch --bar_colors distro 5
bar_color_elapsed="distro"
bar_color_total="distro"


# Info display
# Display a bar with the info.
#
# Default: 'off'
# Values:  'bar', 'infobar', 'barinfo', 'off'
# Flags:   --cpu_display
#          --memory_display
#          --battery_display
#          --disk_display
#
# Example:
# bar:     '[---=======]'
# infobar: 'info [---=======]'
# barinfo: '[---=======] info'
# off:     'info'
cpu_display="off"
memory_display="off"
battery_display="off"
disk_display="off"


# Backend Settings


# Image backend.
#
# Default:  'ascii'
# Values:   'ascii', 'caca', 'catimg', 'jp2a', 'iterm2', 'off', 'tycat', 'w3m'
# Flag:     --backend
image_backend="w3m"

# Image Source
#
# Which image or ascii file to display.
#
# Default:  'auto'
# Values:   'auto', 'ascii', 'wallpaper', '/path/to/img', '/path/to/ascii', '/path/to/dir/'
# Flag:     --source
#
# NOTE: 'auto' will pick the best image source for whatever image backend is used.
#       In ascii mode, distro ascii art will be used and in an image mode, your
#       wallpaper will be used.
image_source="$terminalImgSelect"


# Ascii Options


# Ascii distro
# Which distro's ascii art to display.
#
# Default: 'auto'
# Values:  'auto', 'distro_name'
# Flag:    --ascii_distro
#
# NOTE: Arch and Ubuntu have 'old' logo variants.
#       Change this to 'arch_old' or 'ubuntu_old' to use the old logos.
# NOTE: Ubuntu has flavor variants.
#       Change this to 'Lubuntu', 'Xubuntu', 'Ubuntu-GNOME' or 'Ubuntu-Budgie' to use the flavors.
# NOTE: Arch, Crux and Gentoo have a smaller logo variant.
#       Change this to 'arch_small', 'crux_small' or 'gentoo_small' to use the small logos.
ascii_distro="auto"

# Ascii Colors
#
# Default:  'distro'
# Values:   'distro', 'num' 'num' 'num' 'num' 'num' 'num'
# Flag:     --ascii_colors
#
# Example:
# ascii_colors=(distro)      - Ascii is colored based on Distro colors.
# ascii_colors=(4 6 1 8 8 6) - Ascii is colored using these colors.
ascii_colors=(distro)

# Bold ascii logo
# Whether or not to bold the ascii logo.
#
# Default: 'on'
# Values:  'on', 'off'
# Flag:    --ascii_bold
ascii_bold="on"


# Image Options


# Image loop
# Setting this to on will make neofetch redraw the image constantly until
# Ctrl+C is pressed. This fixes display issues in some terminal emulators.
#
# Default:  'off'
# Values:   'on', 'off'
# Flag:     --loop
image_loop="off"

# Thumbnail directory
#
# Default: '~/.cache/thumbnails/neofetch'
# Values:  'dir'
thumbnail_dir="${XDG_CACHE_HOME:-${HOME}/.cache}/thumbnails/neofetch"

# Crop mode
#
# Default:  'normal'
# Values:   'normal', 'fit', 'fill'
# Flag:     --crop_mode
#
# See this wiki page to learn about the fit and fill options.
# https://github.com/dylanaraps/neofetch/wiki/What-is-Waifu-Crop%3F
crop_mode="normal"

# Crop offset
# Note: Only affects 'normal' crop mode.
#
# Default:  'center'
# Values:   'northwest', 'north', 'northeast', 'west', 'center'
#           'east', 'southwest', 'south', 'southeast'
# Flag:     --crop_offset
crop_offset="center"

# Image size
# The image is half the terminal width by default.
#
# Default: 'auto'
# Values:  'auto', '00px', '00%', 'none'
# Flags:   --image_size
#          --size
image_size="auto"

# Ggap between image and text
#
# Default: '3'
# Values:  'num', '-num'
# Flag:    --gap
gap=3

# Image offsets
# Only works with the w3m backend.
#
# Default: '0'
# Values:  'px'
# Flags:   --xoffset
#          --yoffset
yoffset=0
xoffset=0

# Image background color
# Only works with the w3m backend.
#
# Default: ''
# Values:  'color', 'blue'
# Flag:    --bg_color
background_color=


# Scrot Options


# Whether or not to always take a screenshot
# You can manually take a screenshot with "--scrot" or "-s"
#
# Default: 'off'
# Values:  'on', 'off'
# Flags:   --scrot
#          -s
scrot="off"

# Screenshot Program
# Neofetch will automatically use whatever screenshot tool
# is installed on your system.
#
# If 'neofetch -v' says that it couldn't find a screenshot
# tool or you're using a custom tool then you can change
# the option below to a custom command.
#
# Default: 'auto'
# Values:  'auto' 'cmd -flags'
# Flag:    --scrot_cmd
scrot_cmd="auto"

# Screenshot Filename
# What to name the screenshots
#
# Default: 'neofetch-$(date +%F-%I-%M-%S-${RANDOM}).png'
# Values:  'string'
# Flag:    --scrot_name
scrot_name="neofetch-$(date +%F-%I-%M-%S-${RANDOM}).png"

# Image upload host
# Where to upload the image.
#
# Default: 'teknik'
# Values:  'imgur', 'teknik'
# Flag:    --image_host
#
# NOTE: If you'd like another image host to be added to Neofetch.
#       Open an issue on github.
image_host="teknik"


# Misc Options


# Config version.
#
# NOTE: Don't change this value, neofetch reads this to determine
# how to handle backwards compatibility.
config_version="$neofetchVersao"
  " > ~/.config/neofetch/config
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
        remover-terminal;
        reset;
        aparencia;
        ;;

         3)reset;
           setar-imagem-terminal;
           reset;
           aparencia;
           ;;

        *) reset;
           opcoes-terminal;
  esac

}

  banner "Aparência"
  echo ""
  submenu-item 1 "Temas"
  submenu-item 2 "Cursores"
  submenu-item 3 "Ícones"
  submenu-item 4 "Conky"
  submenu-item 5 "Terminal"
  submenu-item 6 "Gnome-Tweak-Tool"
  submenu-item 7 "PhotoGimp"
  echo ""
  echo -e "${azul}X) ${amarelo}Voltar ao menu principal${NORMAL}"
  read -n1 temeInsta

  while [ temeInsta != '' ]
  do
    case $temeInsta in

      1) reset;
         opcoes-tema;
         reset;
         aparencia;
         ;;

         2) reset;
            opcoes-cursor;
            reset;
            aparencia;
            ;;

            3) reset;
               opcoes-icone;
               reset;
               aparencia;
               ;;

               4)reset;
                 opcoes-conky;
                 reset;
                 aparencia;
                 ;;

              5)reset;
                opcoes-terminal;
                reset;
                aparencia;
                ;;

               6) reset;
                  tema-gimp-diolinux;
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
