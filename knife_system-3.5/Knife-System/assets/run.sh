#!/bin/bash
verm=`echo "\033[01;31m"`
verde=`echo "\033[01;32m"`
ciano=`echo "\033[01;36m"`
nml=`echo "\033[m"`
HORA=$(date +%H)

if [ $HORA -ge 06 -a $HORA -le 11 ] ; then
   echo -e "${ciano}Bom dia! ${verde}$USER${nml}"
elif [ $HORA -ge 12 -a $HORA -le 17 ]; then
   echo -e "${ciano}Boa tarde! ${verde}$USER${nml}"
else
   echo -e "${ciano}Boa noite! ${verde}$USER${nml}"
fi
echo ""
echo -e "${ciano}O Knife System requer permissões de root para funcionar, por favor digite sua senha:${nml}"
sudo bash /opt/Knife-System/knife
