#!/bin/bash
TODAY=`date "+%Y%m%d" | tr -d "\n"`
SSH_LOG_DIR="$HOME/Documents/ssh-logs/${TODAY}/"

if [ ! -d ${SSH_LOG_DIR} ];then
	mkdir -p ${SSH_LOG_DIR}
fi

FILENAME="${SSH_LOG_DIR}`echo $@ | perl -pne 's/(\w+\@)|ssh|sls//g' | perl -pne 's/\-l\ ?\w+\ ?//' | perl -pne 's/\-i\ [\w\~\.\/]+//' | perl -pne 's/\--?[a-zA-z0-9]+//g' | perl -pne 's/\ {2,}/ /g' | perl -lne 'print $1 if /([\w\.]+)(.{3}|.?)$/'`"

echo -e "*** START `date +%T` ***" >> ${FILENAME}
/usr/bin/ssh $@ |tee -a ${FILENAME}
echo -e "*** STOP  `date +%T` ***" >> ${FILENAME}
exit $?
