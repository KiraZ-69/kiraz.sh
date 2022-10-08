#!/bin/sh
yellow='\e[1;33m'
no='\e[0m'
green='\e[0;32m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
white='\e[1;37m'
red='\e[1;31m'
version=$(curl -s https://raw.githubusercontent.com/KiraZ-69/kiraz.sh/main/main/version.txt?token=GHSAT0AAAAAABYIPJAO3Z3CH5RG4UHXHIRIY2B6YWQ)
# check the parameters of the script
if [ $# -eq 0 ]
then
echo " "
echo "${red}Erreur :${no} ${yellow}merci de rentrer un parametre${no}"
echo " "
echo "${green}Usage :${no} ${cyan}kiraz [parameter]${no}"
echo " "
echo "${green}list des commande :${no}"
echo "${cyan}update${no} ${yellow}Update KiraZ.sh${no}"
echo "${cyan}uninstall${no} ${yellow}Uninstall KiraZ.sh${no}"
echo "${cyan}help${no} ${yellow}montre les commande${no}"
echo " "
exit
fi
# if the parameter is install
if [ $1 = update ]
then
# check the version of KiraZ.sh
version=$(cat /etc/kiraz/version.txt)
# check the version of KiraZ.sh on github
versiongithub=$(curl -s https://raw.githubusercontent.com/KiraZ-69/kiraz.sh/main/main/version.txt)
# if the version of KiraZ.sh is the same as the version on github
if [ $version = $versiongithub ]
then
echo " "
echo "${yellow}KiraZ.sh est a jours${no}"
echo " "
exit
fi
# if the version of KiraZ.sh is not the same as the version on github
if [ $version != $versiongithub ]
then
echo " "
echo "${yellow}Updating KiraZ.sh...${no}"
echo " "
# delete the old version of KiraZ.sh
rm -rf /etc/kiraz
# create the folder /etc/kiraz
mkdir /etc/kiraz
# download the new version of KiraZ.sh
wget "https://raw.githubusercontent.com/KiraZ-69/kiraz.sh/main/fr/kiraz.sh" -O /etc/kiraz/kiraz.sh
wget "https://raw.githubusercontent.com/KiraZ-69/kiraz.sh/main/main/version.txt" -O /etc/kiraz/version.txt
# make the script executable
chmod +x /etc/kiraz/kiraz.sh
# create the symbolic link
ln -s /etc/kiraz/kiraz.sh /usr/bin/kiraz
chmod +x /usr/bin/kiraz
echo " "
echo "${yellow}KiraZ.sh a bien ete mit a jours${no}"
echo " "
fi
