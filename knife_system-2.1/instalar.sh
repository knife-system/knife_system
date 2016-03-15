#!/bin/bash
# Esse pequeno script serve para você instalar o knife_system
# para maior proveito.
# execute esse script como root.

verm="\033[1;31m"
verde="\033[1;32m"
amarelo="\033[1;33m"
NORMAL="\033[m"

function global() {

function inst() {
  if [ -e /bin/knife ];then
    echo -e "${verm}Script já instalado${NORMAL}"
    sleep 2
    reset
    global
  else
echo -e "${amarelo}Instalando script...${NORMAL}"
sleep 2
mv knife /bin
chmod 7777 /bin/knife
reset
echo -e "${verde}script instalado com sucesso${NORMAL}"
echo ""
sleep 1
echo -e "${amarelo}Agora para inicia-lo basta apenas digitar no terminal ${verm}knife${NORMAL}"
fi
}

function desi() {
  if [ -e /bin/knife ];then
 echo -e "${verm}Desinstalando script...${NORMAL}"
 sleep 2
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

reset
echo -e "${amarelo}O que deseja fazer?${NORMAL}"
echo ""
echo -e "${amarelo}1)${verde} Instalar${NORMAL}"
echo -e "${amarelo}2)${verm} Desinstalar${NORMAL}"
read -n1 globResp

case $globResp in

 1) reset;
    inst;
    ;;
 2) reset;
    desi;
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
