#!/bin/bash
verm=`echo "\033[01;31m"`
verde=`echo "\033[01;32m"`
ciano=`echo "\033[01;36m"`
nml=`echo "\033[m"`
HORA=$(date +%H)
# o -ge (maior ou igual) o -a (and)
if [ $HORA -ge 06 -a $HORA -le 11 ] ; then
   echo -e "${ciano}Bom dia! ${verde}$USER${nml}"
elif [ $HORA -ge 12 -a $HORA -le 17 ]; then
   echo -e "${ciano}Boa tarde! ${verde}$USER${nml}"
else
   echo -e "${ciano}Boa noite! ${verde}$USER${nml}"
fi
echo ""
echo -e "${verm}Digite sua senha para entrar no KS:${nml}"
sudo bash /opt/Knife-System/knife
