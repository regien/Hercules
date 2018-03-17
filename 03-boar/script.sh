#!/bin/bash

message=$1
subject=$2
command=$(ECHO $1 | MAIL -S $2 ROOT)

if [ -z "$1" ] || [ -z "$2" ]; then
	echo "Program to SEND a MAIL with a custom MESSAGE and SUBJECT"
	echo "usage: sh $0 Message Subject"
else
	$command
fi

#ECHO $(AT NOW < GELIZA)
#ECHO "TU PENDEJADA FUE CREADA"
