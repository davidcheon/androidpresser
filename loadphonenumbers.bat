@echo off
adb -s 127.0.0.1:19105 push exportphonenumbers.sh /vendor/test/

adb -s 127.0.0.1:19105 shell "su -c 'rm -rf /sdcard/Download/*'"

adb -s 127.0.0.1:19105 shell sh /vendor/test/exportphonenumbers.sh 1130


adb -s 127.0.0.1:19105 shell "su -c 'rm -rf /sdcard/Download/9j'"

adb -s 127.0.0.1:19105 shell "su -c 'cat /sdcard/Download/* > /vendor/test/data/data.txt'"

adb -s 127.0.0.1:19105  pull /vendor/test/data/data.txt data

python getphonenumberfromtext.py