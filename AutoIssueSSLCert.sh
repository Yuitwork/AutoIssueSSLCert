#!/usr/bin/env bash

#=================================================
#  AutoIssueSSLCert
#  Version: v0.1.1
#  Author: 夜棂依Yareiy
#  GitHub: https://github.com/Yuitwork/AutoIssueSSLCert
#=================================================

# Modify the unzip password set by ZIPPWD for yourself
ZIPPWD="****************"
# Modify [Your-GitHub-username] to your own
ZIPLINK="https://raw.githubusercontent.com/[Your-GitHub-username]/AutoIssueSSLCert/main/Certs.zip"
# Modify 'CERTFILE' to your own certificate installation path
CERTFILE="/usr/local/openresty/nginx/conf/ssl"
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[Info]${Font_color_suffix}"
Error="${Red_font_prefix}[Error]${Font_color_suffix}"
Date="`date +%Y%m%d`"

# Start
echo -e "${Info} Start !"
cd "${CERTFILE}"
mkdir AutoIssueSSLCert
cd "${CERTFILE}/AutoIssueSSLCert"
echo -e "${Info} Start downloading Certs.zip !"
wget -O Certs.zip "${ZIPLINK}"
[[ ! -e "Certs.zip" ]] && echo -e "${Error} Certs.zip download failed !" && exit 1
mkdir old
mkdir "old/${Date}"
cd "${CERTFILE}"
find -maxdepth 1 \! -name AutoIssueSSLCert \! -name yuiextensive_miseus.com.crt \! -name yuiextensive_miseus.com.key \! -name . -exec mv {} "AutoIssueSSLCert/old/${Date}" \;
cd "${CERTFILE}/AutoIssueSSLCert"
unzip -P "${ZIPPWD}" Certs.zip
cp -r Certs/* "${CERTFILE}"
#################
cd "${CERTFILE}"
# If you need to modify the certificate name, you can add the code here
# Example: rename file abc.txt to 123.txt
# mv abc.txt 123.txt
#################
echo -e "${Info} Restart Web Server !"
#################
# Set the code to restart your own web server here
# Example: systemctl restart nginx
# systemctl restart nginx
#################
echo -e "${Info} Done !"
