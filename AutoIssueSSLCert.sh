#!/usr/bin/env bash

#=================================================
#  AutoIssueSSLCert
#  Version: v0.1.2
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
mkdir AutoIssueSSLCertTemp
cd "${CERTFILE}/AutoIssueSSLCertTemp"
echo -e "${Info} Start downloading Certs.zip !"
wget -O Certs.zip "${ZIPLINK}"
[[ ! -e "Certs.zip" ]] && echo -e "${Error} Certs.zip Download failed !" && exit 1
if [ -f "Certs.zip" ];then
echo -e "${Info} Certs.zip Download successful !"
else
echo -e "${Error} Certs.zip Download failed !" && exit 1
fi
if [ ! -d "${CERTFILE}/AutoIssueSSLCertTemp/old" ];then
mkdir "${CERTFILE}/AutoIssueSSLCertTemp/old"
else
echo -e "${Info} Folder already exists, skip"
fi
if [ ! -d "${CERTFILE}/AutoIssueSSLCertTemp/old/${Date}" ];then
mkdir "${CERTFILE}/AutoIssueSSLCertTemp/old/${Date}"
cd "${CERTFILE}"
find -maxdepth 1 \! -name AutoIssueSSLCertTemp \! -name . -exec mv {} "AutoIssueSSLCertTemp/old/${Date}" \;
else
echo -e "${Info} Folder already exists"
cd "${CERTFILE}"
mkdir "${CERTFILE}/AutoIssueSSLCertTemp/old/${Date}/1/"
find -maxdepth 1 \! -name AutoIssueSSLCertTemp \! -name . -exec mv {} "AutoIssueSSLCertTemp/old/${Date}/1" \;
fi
cd "${CERTFILE}/AutoIssueSSLCertTemp"
unzip -P "${ZIPPWD}" Certs.zip
\cp -rf Certs/* "${CERTFILE}"
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
rm -rf "${CERTFILE}/AutoIssueSSLCertTemp/Certs.zip"
rm -rf "${CERTFILE}/AutoIssueSSLCertTemp/Certs"
#################
echo -e "${Info} Done !"
