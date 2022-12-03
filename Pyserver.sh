#! /bin/bash

setterm -foreground green
#directory verification
directory=$(pwd)


if which figlet >/dev/null; then
sleep 1
echo ""                                                                                              
echo  "(figlet) ................................................... Instalado [✓]"
else
sleep 1
echo  "$(figlet) No instalado [✗]"
sleep 1
echo  "Instalando figlet ..."
sleep 3
pkg install figlet
fi

#directory verification
directory=$(pwd)


if which python >/dev/null; then
sleep 1
echo ""            
echo  "(python) ................................................... Instalado [✓]"
else
sleep 1
echo  "(python) No instalado [✗]"
sleep 1
echo "Instalando python ..."
sleep 3
pkg install python -y
fi
clear

setterm -foreground green
figlet Py Server
setterm -foreground white
echo -e "                      \e[1;37;41mCreated by. MRX90902WX\e[0m"
echo ""
while :
do
#Menú
#Escojeg menú
setterm -foreground green
echo "--------------------------"
echo "| SUBIR ARCHIVOS A LA WEB |"
setterm -foreground green
echo "---------------------------------------------"
echo -e "\e[1;32m|\e[0m \e[1;35m[1].\e[0m\e[1;36mNavegar por los Directorios Termux\e[0m    \e[1;32m|\e[0m"
echo -e "\e[1;32m|\e[0m \e[1;35m[2].\e[0m\e[1;36mNavegar en Directorios /sdcard\e[0m        \e[1;32m|\e[0m"
echo -e "\e[1;32m|\e[0m \e[1;35m[3].\e[0m\e[1;36mNavegar en /sdcard\e[0m                   \e[1;32m |\e[0m"
setterm -foreground green
echo "---------------------------------------------"
echo -e -n "\e[1;33m [*]\e[0m\e[1;31mOPCION\e[0m \e[1;34m>>\e[0m "
read opcion
clear
#Seleccion de menu
case $opcion in
1)
#! /bin/bash
cd
ls
setterm -foreground green
echo -n "[+]Escriba lu ruta donde estan los archivos >> "
read a
cd $HOME/$a
echo ""
echo -n "[+]Escribe un puerto >> "
read b
echo ""
sleep 1
echo "Ejecutando localhost:$b en Diretorios Termux $a"
echo "Listo puedes conectarlo a un tunel ssh, ngrok o cloudflared"
echo ""
echo "-->ssh -R 80:localhost:$b nokey@localhost.run<--"
echo "-->ngrok http $b<--"
echo "-->cloudflared -url localhost:$b<--"
echo ""
python -m http.server $b
#
;;
2)
#! /bin/bash
cd /sdcard
ls
setterm -foreground green
echo -n "[+]Escriba lu ruta donde estan los archivos ej.[Pictures] >> "
read a
cd /sdcard/$a
echo ""
echo -n "[+]Escribe un puerto >> "
read b
echo ""
sleep 1
echo "Ejecutando localhost:$b en Directorio /sdcard/$a"
echo "Listo puedes conectarlo a un tunel ssh, ngrok o cloudflared"
echo ""
echo "-->ssh -R 80:localhost:$b nokey@localhost.run<--"
echo "-->ngrok http $b<--"
echo "-->cloudflared -url localhost:$b<--"
echo ""
python -m http.server $b
#
;;
3)
#! /bin/bash
cd /sdcard
setterm -foreground green
echo -n "[+]Escribe un puerto >> "
read b
echo ""
sleep 1
setterm -foreground green
echo "Ejecutando localhost:$b en /sdcard"
echo "Listo puedes conectarlo a un tunel ssh, ngrok o cloudflared"
echo ""
echo "-->ssh -R 80:localhost:$b nokey@localhost.run<--"
echo "-->ngrok http $b<--"
echo "-->cloudflared -url localhost:$b<--"
echo ""
python -m http.server $b
#
;;
esac
done
