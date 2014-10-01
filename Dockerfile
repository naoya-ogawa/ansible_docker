FROM centos:latest
MAINTAINER original <test@example.com>
#
# make sure the package repository is up to date
Run localedef -f UTF-8 -i ja_JP /usr/lib/locale/ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

ADD update.sh /var/

Run cd /var/ && ./update.sh

