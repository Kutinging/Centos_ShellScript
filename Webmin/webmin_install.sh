#/bin/sh
echo -e "\nDownload Webmin repo.\n"
sleep 2
sudo wget -P /etc/yum.repos.d/ https://raw.githubusercontent.com/Kutinging/Centos_ShellScript/master/Webmin/Webmin.repo

echo -e "\nImport webmin GPG key.\n"
sleep 2
sudo rpm --import http://www.webmin.com/jcameron-key.asc

echo -e "\nInstall epel-release and Webmin.\n"
sleep 2
sudo yum install epel-release -y
sudo yum install webmin -y

sudo ln -s /etc/webmin/reload /usr/local/bin/webmin-reload
sudo ln -s /etc/webmin/restart /usr/local/bin/webmin-restart
sudo ln -s /etc/webmin/start /usr/local/bin/webmin-start
sudo ln -s /etc/webmin/stop /usr/local/bin/webmin-stop

echo -e "\nYou can enter 'webmin-reload' to reload webmin, 'webmin-restart' to restart webmin, 'webmin-start' to start webmin, 'webmin-stop' to stop webmin.\n"