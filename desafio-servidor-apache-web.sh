#!/bin/bash

echo "Atualizando o servidor..."
apt upgrade -y

echo "Instalando o apache2 e o unzip..."
apt install apache2 -y
apt install unzip -y

echo "Baixando o zip de: https://github.com/denilsonbonatti/linux-site-dio..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "Extraindo o zip para linux-site-dio-main..."
unzip main.zip

echo "Removendo o arquivo default do apache2..."
rm /var/www/html/index.html

echo "Copiando todos os arquivos da pasta extraída para /var/www/html/"
cd linux-site-dio-main
cp -R * /var/www/html/


