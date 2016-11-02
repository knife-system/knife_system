#!/bin/bash
# Esse pequeno script serve para você instalar o knife_system
# para maior proveito.
# execute esse script como root.

verm="\033[1;31m"
verde="\033[1;32m"
amarelo="\033[1;33m"
NORMAL="\033[m"
ciano="\033[01;36m"

function global() {

function inst() {
  if [ -e /opt/Knife-System ];then
    echo -e "${verm}Script já instalado${NORMAL}"
    sleep 2
    reset
    global
  else
echo -e "${amarelo}Instalando script...${NORMAL}"
sleep 2
cd Knife-System
cp -Rf knife /bin
chmod +x /bin/knife
cd ..
mv Knife-System /opt
chmod -R 7777 /opt/Knife-System
echo "
[Desktop Entry]
Name=Knife System
Exec=sh -c \"cd /opt/Knife-System/assets && ./run.sh;sudo -s\"
Icon=/opt/Knife-System/assets/logo.png
Type=Application
Terminal=true
Categories=GTK;GNOME;Utility" > /usr/share/applications/Knife.desktop
reset
echo -e "${verde}script instalado com sucesso${NORMAL}"
echo ""
sleep 1
echo -e "${amarelo}Procure pelo script em acessórios ou algo equivalente${NORMAL}"
echo -e "${amarelo}ou digite no terminal ${ciano}knife${NORMAL}"
fi
}

function desi() {
  if [ -e /opt/Knife-System ];then
 echo -e "${verm}Desinstalando script...${NORMAL}"
 sleep 2
rm -r /opt/Knife-System
rm /usr/share/applications/Knife.desktop
rm /bin/knife
 echo -e "${verde}Script desinstalado com sucesso!${NORMAL}"
 sleep 1
 else
   echo -e "${verm}Script não instalado${NORMAL}"
   sleep 2
   reset
   global
 fi
}
function atual() {
  if [ -e /opt/Knife-System ];then
  echo -e "${ciano}Atualizando...${NORMAL}"
  sleep 1
  rm -r /opt/Knife-System
  rm /usr/share/applications/Knife.desktop
  rm /bin/knife
  cd Knife-System
  cp -Rf knife /bin
  chmod +x /bin/knife
  cd ..
  mv Knife-System /opt
  chmod -R 7777  /opt/Knife-System
  echo "
  [Desktop Entry]
  Name=Knife System
  Exec=sh -c \"cd /opt/Knife-System/assets && ./run.sh;sudo -s\"
  Icon=/opt/Knife-System/assets/logo.png
  Type=Application
  Terminal=true
  Categories=GTK;GNOME;Utility" > /usr/share/applications/Knife.desktop
  echo ""
  echo -e "${verde}Script atualizado!${NORMAL}"
  sleep 1
 else
   echo -e "${verm}Script não instalado${NORMAL}"
   sleep 2
   reset
   global
 fi
}

reset
echo -e "${amarelo}O que deseja fazer?${NORMAL}"
echo ""
echo -e "${amarelo}1)${verde} Instalar${NORMAL}"
echo -e "${amarelo}2)${verm} Desinstalar${NORMAL}"
echo -e "${amarelo}3)${ciano} Atualizar${NORMAL}"
read -n1 globResp

case $globResp in

 1) reset;
    inst;
    ;;
 2) reset;
    desi;
    ;;

  3)reset;
    atual;
    ;;

 *) reset;
    global;
    ;;
esac
}
if [ `whoami` == "root" ];then
 global;
else
    echo ""
	echo -e $verm "Você precisa ser root digite sua senha e tente novamente${NORMAL}"
    sudo su
fi
