#!/bin/bash

mail_dir=/home/14/ren/source/mail/
sender=$mail_dir/sender/
backup=$mail_dir/backup/
to_mail="justnow.ren@gmail.com"
function format_mail() {
    body=$1
    attach=$1
    lines=`cat ${file} |wc -l`
    if [ $lines -gt 30 ]; then
	tmp=$backup/tmp.body
	head $body -n5 > $tmp
	cat $backup/template.body >> $tmp
	tail $body -n30 >> $tmp
	body=$tmp
    fi
    #actually send the mail and attach log file
    base=`basename ${attach}`
    #echo "base is ${base}"
    subject="[Experiment]${base}"
    echo "Send Mail with Subject : ${subject} "
    echo $body | mail -s "$subject" -a "$attach" "${to_mail}" < $body
}

function send_mail() {
    files=$sender/*.mail
    for file in $files; do
	now=`date +%Y%m%d-%H:%M:%S`
	base=`basename $file`
	echo "#@ ${now} #====> ${base} "
	format_mail $file
	backup_base="${now}|${base}"
	echo "Backup#${base}==>${backup_base}"
	mv $file ${backup}/${backup_base}
    done
}

function test_mail() {
    num=`ls ${sender} | grep '\.mail'|wc -l`
    now=`date +%Y%m%d-%H:%M:%S`
    echo "##############Checking Time at ${now} ######################"
    echo "there is ${num} mails!"
    if [ $num -lt 1 ]; then
	echo "nothing to do"
    else
	echo "send mail"
	send_mail
    fi
}

test_mail
