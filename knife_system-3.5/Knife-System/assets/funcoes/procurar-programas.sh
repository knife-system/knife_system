function achar() {
  function progAcha() {
   echo -e $verm"#############################################${NORMAL}"
   echo -e "                   ${verde}Procurar               ${NORMAL}"
   echo -e $verm"#############################################${NORMAL}"
   echo ""
   echo -e $amarelo"Digite o nome do programa:${NORMAL}"
   read ach
   echo -e $ciano""
   apt-cache pkgnames $ach | grep $ach
   echo ""
   echo -e "${verde}Pressione ${amarelo}[ Q ] ${verde}para voltar${NORMAL}"
   echo ""
   echo -e "${amarelo}Pressione ${verde}[ N ] ${amarelo}para uma nova busca${NORMAL}"
   read -n1 acharResp

   case $acharResp in

     Q | q)fazer;
           ;;

           n | N)reset;
                 progAcha;
                 ;;
      *)reset;
        progAcha;
    esac
}

function cat-net() {
   function net-firefox() {
     echo -e "${verm}Instalando firefox... Aguarde...${NORMAL}"
     apt-get -y --force-yes install firefox | pv -W > /dev/null
     if [ $? == 0 ];then
     echo -e "${verde}Firefox instalado!${NORMAL}"
     sleep 1
   else
     echo -e "${verm}Problemas ao instalar o firefox!${NORMAL}"
     sleep 1
   fi
   }
   function net-chro() {
     echo -e "${verm}Instalando chromium... Aguarde...${NORMAL}"
     apt-get -y --force-yes install chromium | pv -W > /dev/null
     if [ $? == 0 ];then
     echo -e "${verde}Chromium instalado!${NORMAL}"
     sleep 1
   else
     echo -e "${verm}Problemas ao instalar o Chromium!${NORMAL}"
     sleep 1
   fi
 }
 function net-zilla() {
   echo -e "${verm}Instalando FileZilla... Aguarde...${NORMAL}"
   apt-get -y --force-yes install filezilla | pv -W > /dev/null
   if [ $? == 0 ];then
   echo -e "${verde}FileZilla instalado!${NORMAL}"
   sleep 1
 else
   echo -e "${verm}Problemas ao instalar o FileZilla!${NORMAL}"
   sleep 1
 fi
}
function net-torrent() {
  echo -e "${verm}Instalando Qbittorrent... Aguarde...${NORMAL}"
  apt-get -y --force-yes install qbittorrent | pv -W > /dev/null
  if [ $? == 0 ];then
  echo -e "${verde}Qbittorrent instalado!${NORMAL}"
  sleep 1
else
  echo -e "${verm}Problemas ao instalar o Qbittorrent!${NORMAL}"
  sleep 1
fi
}
function net-thun() {
  echo -e "${verm}Instalando Thunderbird... Aguarde...${NORMAL}"
  apt-get -y --force-yes install thunderbird | pv -W > /dev/null
  if [ $? == 0 ];then
  echo -e "${verde}Thunderbird instalado!${NORMAL}"
  sleep 1
else
  echo -e "${verm}Problemas ao instalar o Thunderbird!${NORMAL}"
  sleep 1
fi
}
function net-pidg() {
  echo -e "${verm}Instalando Pidgin... Aguarde...${NORMAL}"
  apt-get -y --force-yes install pidgin | pv -W > /dev/null
  if [ $? == 0 ];then
  echo -e "${verde}Pidgin instalado!${NORMAL}"
  sleep 1
else
  echo -e "${verm}Problemas ao instalar o Pidgin!${NORMAL}"
  sleep 1
fi
}

function net-hex() {
  echo -e "${verm}Instalando HexChat... Aguarde...${NORMAL}"
  apt-get -y --force-yes install hexchat | pv -W > /dev/null
  if [ $? == 0 ];then
  echo -e "${verde}Hexchat instalado!${NORMAL}"
  sleep 1
else
  echo -e "${verm}Problemas ao instalar o Hexchat!${NORMAL}"
  sleep 1
fi
}

function net-ssh() {
  echo -e "${verm}Instalando SSH... Aguarde...${NORMAL}"
  apt-get -y --force-yes install ssh | pv -W > /dev/null
  if [ $? == 0 ];then
  echo -e "${verde}SHH instalado!${NORMAL}"
  sleep 1
else
  echo -e "${verm}Problemas ao instalar o SSH!${NORMAL}"
  sleep 1
fi
}

   echo -e "${amarelo}1) ${verde}Firefox${NORMAL}"
   echo -e "${amarelo}2) ${verde}chromium${NORMAL}"
   echo -e "${amarelo}3) ${verde}filezilla${NORMAL}"
   echo -e "${amarelo}4) ${verde}Qbittorrent${NORMAL}"
   echo -e "${amarelo}5) ${verde}Thunderbird${NORMAL}"
   echo -e "${amarelo}6) ${verde}pidgin${NORMAL}"
   echo -e "${amarelo}7) ${verde}Hexchat${NORMAL}"
   echo -e "${amarelo}8) ${verde}SSH${NORMAL}"
   echo ""
   echo -e "${azul}Escolha uma das opções, ou pressione [Q] para voltar:${NORMAL}"
   read -n1 netResp
   case $netResp in
     1)reset;
       net-firefox;
       reset;
       achha;
       ;;

       2)reset;
         net-chro;
         reset;
         achha;
         ;;

         3)reset;
           net-zilla;
           reset;
           achha;
           ;;

           4)reset;
            net-torrent;
            reset;
            achha;
            ;;

            5)reset;
              net-thun;
              reset;
              achha;
              ;;

              6)reset;
                net-pidg;
                reset;
                achha;
                ;;

                7)reset;
                net-hex;
                reset;
                achha;
                ;;

                8)reset;
                  net-ssh;
                  reset;
                  achha;
                  ;;

                q | Q)reset;
                      fazer;
                      ;;

                      *)reset;
                        cat-net;
   esac

 }

function cat-game() {
  game-zone() {
    echo -e "${verm}Instalando Warzone2100... Aguarde...${NORMAL}"
    apt-get -y --force-yes install warzone2100 | pv -W > /dev/null
    if [ $? == 0 ];then
    echo -e "${verde}WarZone2100 instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o WarZone2100!${NORMAL}"
    sleep 1
  fi
  }
  game-tux() {
    echo -e "${verm}Instalando SuperTux... Aguarde...${NORMAL}"
    apt-get -y --force-yes install supertux | pv -W > /dev/null
    if [ $? == 0 ];then
    echo -e "${verde}SuperTux instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o SuperTux!${NORMAL}"
    sleep 1
  fi
  }
  game-wine() {
    echo -e "${verm}Instalando Wine e PlayOnLinux... Aguarde...${NORMAL}"
    apt-get -y --force-yes install wine playonlinux | pv -W > /dev/null
    apt-get install -f | pv -W >/dev/null
    if [ $? == 0 ];then
    echo -e "${verde}Emulador instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Emulador!${NORMAL}"
    sleep 1
  fi
  }
  game-wesh() {
    echo -e "${verm}Instalando Wesnoth... Aguarde...${NORMAL}"
    apt-get -y --force-yes install wesnoth | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Wesnoth instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Wesnoth!${NORMAL}"
    sleep 1
  fi
  }
  game-opar() {
    echo -e "${verm}Instalando OpenArena... Aguarde...${NORMAL}"
    apt-get -y --force-yes install openarena | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}OpenArena instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o OpenArena!${NORMAL}"
    sleep 1
  fi
  }
  echo -e "${amarelo}1) ${verde}Warzone2100${NORMAL}"
  echo -e "${amarelo}2) ${verde}SuperTux${NORMAL}"
  echo -e "${amarelo}3) ${verde}Emulador${NORMAL}"
  echo -e "${amarelo}4) ${verde}wesnoth${NORMAL}"
  echo -e "${amarelo}5) ${verde}Open Arena${NORMAL}"
  echo ""
  echo -e "${azul}Escolha uma das opções, ou pressione [Q] para voltar:${NORMAL}"
  read -n1 gameResp
  case $gameResp in
    1)reset;
      game-zone;
      reset;
      achha;
      ;;

      2)reset;
        game-tux;
        reset;
        achha;
        ;;

        3)reset;
         game-wine;
         reset;
         achha;
         ;;

         4)reset;
           game-wesh;
           reset;
           achha;
           ;;

           5)reset;
             game-opar;
             reset;
             achha;
             ;;

             q | Q)reset;
                   fazer;
                   ;;

                   *)reset;
                     cat-game;
esac
}

function cat-dev() {
  dev-atom() {
    echo -e "${verm}Instalando Atom... Aguarde...${NORMAL}"
    apt-get -y --force-yes install atom | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Atom instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Atom!${NORMAL}"
    sleep 1
  fi
  }
  dev-geay() {
    echo -e "${verm}Instalando Geany... Aguarde...${NORMAL}"
    apt-get -y --force-yes install geany | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Geany instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Geany!${NORMAL}"
    sleep 1
  fi
  }
  dev-blf() {
    echo -e "${verm}Instalando BlueFish... Aguarde...${NORMAL}"
    apt-get -y --force-yes install bluefish | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}BlueFish instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o BlueFish!${NORMAL}"
    sleep 1
  fi
  }
  dev-elp() {
    echo -e "${verm}Instalando Eclipse... Aguarde...${NORMAL}"
    apt-get -y --force-yes install eclipse | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Eclipse instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Eclipse!${NORMAL}"
    sleep 1
  fi
  }
  dev-cobl() {
    echo -e "${verm}Instalando CodeBlocks... Aguarde...${NORMAL}"
    apt-get -y --force-yes install codeblocks | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}CodeBlocks instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o CodeBlocks!${NORMAL}"
    sleep 1
  fi
  }
  dev-qtcr() {
    echo -e "${verm}Instalando QTcreator... Aguarde...${NORMAL}"
    apt-get -y --force-yes install qtcreator | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}QTcreator instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o QTcreator!${NORMAL}"
    sleep 1
  fi
  }

  dev-apa() {
    echo -e "${verm}Instalando Apache2... Aguarde...${NORMAL}"
    apt-get -y --force-yes install apache | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Apache instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Apache!${NORMAL}"
    sleep 1
  fi
  }

  echo -e "${amarelo}1) ${verde}Atom${NORMAL}"
  echo -e "${amarelo}2) ${verde}Geany${NORMAL}"
  echo -e "${amarelo}3) ${verde}BlueFish${NORMAL}"
  echo -e "${amarelo}4) ${verde}Eclipse${NORMAL}"
  echo -e "${amarelo}5) ${verde}CodeBlocks${NORMAL}"
  echo -e "${amarelo}6) ${verde}QTcreator${NORMAL}"
  echo -e "${amarelo}7) ${verde}Apache${NORMAL}"
  echo ""
  echo -e "${azul}escolha uma das opções, ou [Q] para voltar:${NORMAL}"
  read -n1 devResp
  case $devResp in
    1)reset;
      dev-atom;
      reset;
      achha
      ;;

      2)reset;
        dev-geay;
        reset;
        achha;
        ;;

        3)reset;
          dev-blf;
          reset;
          achha;
          ;;

          4)reset;
            dev-elp;
            reset;
            achha;
            ;;

            5)reset;
              dev-cobl;
              reset;
              achha;
              ;;

              6)reset;
                dev-qtcr;
                reset;
                achha;
                ;;

                7)reset;
                dev-apa;
                reset;
                achha;
                ;;

                q | Q)reset;
                      achha;
                      ;;

                      *)reset;
                        cat-dev;
            esac


}

function cat-graf() {
  function graf-gimp() {
    echo -e "${verm}Instalando Gimp... Aguarde...${NORMAL}"
    apt-get -y --force-yes install gimp | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Gimp instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Gimp!${NORMAL}"
    sleep 1
  fi
  }
  function graf-ink() {
    echo -e "${verm}Instalando Inkscape... Aguarde...${NORMAL}"
    apt-get -y --force-yes install inkscape | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Inkscape instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Inkscape!${NORMAL}"
    sleep 1
  fi
  }
  function graf-bldr() {
    echo -e "${verm}Instalando Blender... Aguarde...${NORMAL}"
    apt-get -y --force-yes install blender | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Blender instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Blender!${NORMAL}"
    sleep 1
  fi
  }
  function graf-kolo() {
    echo -e "${verm}Instalando Kolourpaint4... Aguarde...${NORMAL}"
    apt-get -y --force-yes install kolourpaint4 | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Kolourpaint4 instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Kolourpaint4!${NORMAL}"
    sleep 1
  fi
  }
  function graf-mypt() {
    echo -e "${verm}Instalando MyPaint... Aguarde...${NORMAL}"
    apt-get -y --force-yes install mypaint | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}MyPaint instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o MyPaint!${NORMAL}"
    sleep 1
  fi
  }
  echo -e "${amarelo}1) ${verde}GIMP${NORMAL}"
  echo -e "${amarelo}2) ${verde}Inkscape${NORMAL}"
  echo -e "${amarelo}3) ${verde}Blender${NORMAL}"
  echo -e "${amarelo}4) ${verde}Kolourpaint4${NORMAL}"
  echo -e "${amarelo}5) ${verde}MyPaint${NORMAL}"
  echo ""
  echo -e "${azul}escolha uma das opções, ou [Q] para voltar:${NORMAL}"
  read -n1 grafResp
  case $grafResp in
    1)reset;
      graf-gimp;
      reset;
      achha;
      ;;

      2)reset;
        graf-ink;
        reset;
        achha;
        ;;

        3)reset;
         graf-bldr;
         reset;
         achha;
         ;;

         4)reset;
           graf-kolo;
           reset;
           achha;
           ;;

           5)reset;
             graf-mypt;
             reset;
             achha;
             ;;

             q | Q)reset;
                   achha;
                   ;;

                   *)reset;
                     cat-graf;
                     ;;

                   esac
}
function cat-auvid() {
  function auvid-vlc() {
    echo -e "${verm}Instalando VLC... Aguarde...${NORMAL}"
    apt-get -y --force-yes install vlc | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}VLC instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o VLC!${NORMAL}"
    sleep 1
  fi
  }
  function auvid-rth() {
    echo -e "${verm}Instalando Rhythmbox... Aguarde...${NORMAL}"
    apt-get -y --force-yes install rhythmbox | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Rhythmbox instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Rhythmbox!${NORMAL}"
    sleep 1
  fi
  }
  function auvid-kde() {
    echo -e "${verm}Instalando Kdenlive... Aguarde...${NORMAL}"
    apt-get -y --force-yes install kdenlive | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Kdenlive instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Kdenlive!${NORMAL}"
    sleep 1
  fi
  }
  function auvid-bso() {
    echo -e "${verm}Instalando Brasero... Aguarde...${NORMAL}"
    apt-get -y --force-yes install brasero | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Brasero instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Brasero!${NORMAL}"
    sleep 1
  fi
  }
  function auvid-kzm() {
    echo -e "${verm}Instalando Kazam... Aguarde...${NORMAL}"
    apt-get -y --force-yes install kazam | pv -W > /dev/null
    apt-get
    if [ $? == 0 ];then
    echo -e "${verde}Kazam instalado!${NORMAL}"
    sleep 1
  else
    echo -e "${verm}Problemas ao instalar o Kazam!${NORMAL}"
    sleep 1
  fi
  }
  echo -e "${amarelo}1) ${verde}VLC${NORMAL}"
  echo -e "${amarelo}2) ${verde}Rhythmbox${NORMAL}"
  echo -e "${amarelo}3) ${verde}Kdenlive${NORMAL}"
  echo -e "${amarelo}4) ${verde}Brasero${NORMAL}"
  echo -e "${amarelo}5) ${verde}Kazam${NORMAL}"
  echo ""
  echo -e "${azul}escolha uma das opções, ou [Q] para voltar:${NORMAL}"
  read -n1 grafResp
  case $grafResp in
    1)reset;
      auvid-vlc;
      reset;
      achha;
      ;;

      2)reset;
        auvid-rth;
        reset;
        achha;
        ;;

        3)reset;
         auvid-kde;
         reset;
         achha;
         ;;

         4)reset;
           auvid-bso;
           reset;
           achha;
           ;;

           5)reset;
             auvid-kzm;
             reset;
             achha;
             ;;

             q | Q)reset;
                   achha;
                   ;;

                   *)reset;
                     cat-auvid;
                     ;;

                   esac
}
echo -e "${ciano}0) ${amarelo}Procurar${NORMAL}"
echo ""
echo -e "${amarelo}1) ${ciano}Internet${NORMAL}"
echo -e "${amarelo}2) ${ciano}Jogos${NORMAL}"
echo -e "${amarelo}3) ${ciano}Desenvolvimento${NORMAL}"
echo -e "${amarelo}4) ${ciano}Gráficos${NORMAL}"
echo -e "${amarelo}5) ${ciano}Som e vídeo${NORMAL}"
echo ""
echo -e "${azul}escolha uma das opções, ou [Q] para voltar:${NORMAL}"
read -n1 cateResp
case $cateResp in
  1)reset;
    cat-net;
    reset;
    achha;
    ;;

    2)reset;
     cat-game;
     reset;
     achha;
     ;;

     3)reset;
       cat-dev;
       reset;
       achha;
       ;;

       4)reset;
         cat-graf;
         reset;
         achha;
         ;;

         5)reset;
           cat-auvid;
           reset;
           achha;
           ;;

           0)reset;
             progAcha;
             ;;
           q | Q)reset;
                 fazer;
                  ;;

                  *)reset;
                    achha;

      esac

}
