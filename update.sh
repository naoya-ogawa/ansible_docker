#!/bin/sh
#vim -u ~/.vimrc -i NONE -c "try | NeoBundleUpdate! | finally | q! | endtry" -e -s -V1
#vim +":NeoBundleInstall" +:q

cd /var/
curl -L -O http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
rpm -Uvh epel-release-7-2.noarch.rpm



yum update -y
#yum install -y passwd openssh-server
#touch /etc/rc.d/init.d/functions
#/usr/sbin/sshd -D &
yum install -y git
yum install -y gcc
yum install -y openssh-clients
yum install -y vim
yum install -y --enablerepo=epel ansible
yum install -y sshpass

mkdir -p /.cache/ansible
mv /etc/ansible /etc/ansible_default
ln -s /.cache/ansible/ /etc/ansible

cd /var/ && git clone https://github.com/naoya-ogawa/ide.git
cd / &&  ln -s /var/ide/_vimrc .vimrc 

mkdir -p /.vim/bundle && git clone https://github.com/Shougo/neobundle.vim /.vim/bundle/neobundle.vim


ln -s /.cache/.NERDTreeBookmarks /.NERDTreeBookmarks
export HOME=/
cd /
/.vim/bundle/neobundle.vim/bin/neoinstall

echo ''
