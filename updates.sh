#!/bin/bash

#pass = helloworld

stty -echo
#echo helloworld | sudo -S
clear

echo UPDATING
echo helloworld | sudo -S apt update
clear

echo UPGRADING
echo helloworld | sudo -S apt upgrade
stty echo
clear

echo INSTALLING EMACS\(TEXT EDITOR\)
sudo apt install emacs
clear

echo INSTALLING GNOME TWEAK TOOL
sudo apt install gnome-tweak-tool
clear

echo TRANSFERRING ALL DOCUMENT FILES FROM HDD
cp -r /media/paradigm/MAIN/XPS15/Documents /home/paradigm/Documents/
clear

echo TRANSFERRING THEMES
cd /
sudo mkdir .themes
cp -r /media/paradigm/MAIN/UBUNTU/Themes/* .themes
cd
clear

echo INSTALLING WPS OFFICE
sudo dpkg -i /home/paradigm/Downloads/wps-office_11.1.0.8722_amd64.deb
clear

#echo INSTALLING ANACONDA
#bash /home/paradigm/Downloads/Anaconda3-2019.03-Linux-x86_64.sh
#clear

echo INSTALLING VS CODE
sudo dpkg -i /home/paradigm/Downloads/wps-office_11.1.0.8722_amd64.deb
clear

echo INSTALLING BOOSTNOTES
sudo dpkg -i # Add the file location
clear

