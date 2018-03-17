#!/bin/bash

message=$1
subject=$2

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]
then
	echo ""
	echo "---------------------------------------------------------"
	echo "Program to SEND a MAIL with a custom MESSAGE and SUBJECT"
	echo "usage: sh $0 Message Subject User"
	echo "---------------------------------------------------------"
	echo ""
fi

if [ -n "$1" ] || [ -n "$2" ] || [ -n "$3" ]
then
	echo "echo $1 | mail -s $2 $3" > swaper
	if [ -s ./swaper ]; then
		echo ""
		echo "---------------------------------------------------------"
		echo "swaper is not empty, overwrite"
		echo "---------------------------------------------------------"
		echo ""
	fi
	at -m 8:42 AM December 21 < swaper
fi
