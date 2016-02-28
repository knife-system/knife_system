#!/bin/bash
# Esse pequeno script serve para você instalar o knife_system 
# para maior proveito.
# execute esse script como root.

verm="\033[1;31m"
verde="\033[1;32m"
amarelo="\033[1;33m"
NORMAL="\033[m"

function inst() {
reset
echo -e "${amarelo}Instalando seu script...${NORMAL}"
sleep 2
mv knife /bin
chmod 7777 /bin/knife
reset
echo -e "${verde}script instalado com sucesso${NORMAL}"
echo ""
sleep 0.1
echo -e "${amarelo}Agora para inicia-lo basta apenas digitar no terminal ${verm}knife${NORMAL}"
}

if [ `whoami` == "root" ];then
 inst;
else
    echo ""
	echo -e $verm "Você precisa ser root digite sua senha e tente novamente${NORMAL}"
    sudo su
fi
