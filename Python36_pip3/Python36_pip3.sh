#/bin/sh
echo -e "\nInstall epel-release and Development Tools.\n"
sleep 2

sudo yum install epel-release -y && sudo yum install zip unzip -y
sudo yum groupinstall 'Development Tools' -y

echo -e "\nNow check packages.\n"
sleep 2

packages_list=`yum list installed | grep python36`
if [ `yum list installed | grep python36 |wc -l` -ne 0 ];then
	echo -e "\nAlready install packages list: \n$packages_list"
	sleep 2
else
	echo -e "\nNo found packages.\n Now will install Python3.6 packages.\n"
	sleep 2
	sudo yum install python36 -y
fi

python3_path=`which python36`
if [ `which python36|wc -l` -ne 0 ];then
	echo -e "\nRename python36 to python3\n"
	sleep 2
	mv /usr/bin/python36 /usr/bin/python3
	ln -s -f /usr/lib/python3.6 /usr/local/lib/python3.6
	ln -s -f /usr/lib64/python3.6 /usr/local/lib64/python3.6
else
	if [ `which python3|wc -l` -ne 0 ];then
		echo -e "\nFound Python3\n"
		sleep 2
	else
		echo -e "\nNotfound python36\nProgram will exit.\n"
		sleep 2
		exit 1
	fi
fi

if [ `ls /tmp/setuptools-*.zip|wc -l` -ne 0 ];then
	echo -e "\nAlready found setuptools install packages.\n"
	sleep 2
else
	echo -e "\nNow downloading setuptools install packages.\n"
	sleep 2
	cd /tmp && wget https://files.pythonhosted.org/packages/d3/3e/1d74cdcb393b68ab9ee18d78c11ae6df8447099f55fe86ee842f9c5b166c/setuptools-40.0.0.zip
fi

unzip -o setuptools-*.zip
cd /tmp/setuptools-* && python3 setup.py install

if [ `ls /usr/local/lib/python3.6/site-packages/setuptools*|wc -l` -ne 0 ];then
	if [ `ls /tmp/pip-*.tar.gz|wc -l` -ne 0 ];then
		echo -e "\nAlready found pip install packages.\n"
		sleep 2
	else
		echo -e "\nNow downloading pip install packages.\n"
		sleep 2
		cd /tmp && wget --no-check-certificate https://github.com/pypa/pip/archive/9.0.1.tar.gz -O pip-9.0.1.tar.gz
		tar zxvf pip-*.tar.gz
	fi
	cd /tmp/pip-* && python3 setup.py install
else
	echo -e "\nNotfound setuptools.\nProgram will exit.\n"
	sleep 2
	exit 1
fi

if [ `which pip3|wc -l ` -ne 0 ];then
	echo -e "\nAll install finish.\n"
	sleep 2
	echo `pip3 -V`
	echo `python3 -V`
else
	echo -e "\nError.\n"
	sleep 2
	exit 1
fi


