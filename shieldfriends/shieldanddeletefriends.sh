#!/bin/bash

usage(){
	echo $"Usage:"
}
clicklineapp(){
	input tap 480 340
	sleep 1
}
backtohome(){
	input keyevent 3
	sleep 1
}

orderfirst(){
	input tap 55 175
	input tap 55 175
	sleep 1
}

clickeditfriends(){
	input tap 560 80
	sleep 0.3
	input tap 380 160
	sleep 0.3
}

clicksetting(){
	input tap 560 80
	sleep 0.3
	input tap 410 240
	sleep 0.5
}

deleteshieldedfriends(){
	
	clicksetting

	input tap 300 840
	sleep 0.3
	
	for i in $(seq 1 $lines)
	do
		echo $i
		input tap 530 375
		sleep 0.3

		input tap 300 655
		sleep 1
	done
	input keyevent 4
	sleep 0.3
	input keyevent 4
	sleep 0.3
	backtohome
	
}
clearphonenumber(){
	input tap 560 160
	sleep 0.3
}

typephonenumber(){
	lines=$(cat /vendor/test/sendcontactingroup/data/data.txt|wc -l)
	for i in $(seq 1 $lines)
	do
		echo $i
		if (($i!=1))
		then
			clearphonenumber
		fi
		NUMBER=$(sed -n "${i}p" /vendor/test/sendcontactingroup/data/data.txt)
		input text ${NUMBER:0:14}
		sleep 0.5
		input tap 300 285
		sleep 0.3
	done
	clearphonenumber
	
	input tap 160 1050
	sleep 0.3
	
	input tap 410 645
	sleep 0.5
	
	input keyevent 4
	sleep 0.3
}

#--------------start------------------------
backtohome

clicklineapp

orderfirst

clickeditfriends

typephonenumber

backtohome

clicklineapp

orderfirst

deleteshieldedfriends


