#/bin/sh
echo -e "\nDownload Webmin repo.\n"
sleep 2
wget -P /etc/yum.repos.d/ https://raw.githubusercontent.com/Kutinging/Centos_ShellScript/master/Webmin/Webmin.repo

echo -e "\nImport webmin GPG key.\n"
sleep 2
rpm --import http://www.webmin.com/jcameron-key.asc

echo -e "\nInstall Webmin.\n"
sleep 2
yum install webmin -y

ln -s /etc/webmin/reload /usr/local/bin/webmin-reload
ln -s /etc/webmin/restart /usr/local/bin/webmin-restart
ln -s /etc/webmin/start /usr/local/bin/webmin-start
ln -s /etc/webmin/stop /usr/local/bin/webmin-stop

echo -e "\nYou can enter 'webmin-reload' to reload webmin, 'webmin-restart' to restart webmin, 'webmin-start' to start webmin, 'webmin-stop' to stop webmin."