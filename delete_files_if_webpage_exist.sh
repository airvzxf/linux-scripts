#!/bin/bash


#chmod +x b.sh

#crontab -e
#* * * * * /home/wolf/b.sh >/dev/null 2>&1
#* * * * * /home/wolf/b.sh >>~/.cron.log 2>&1

#crontab -l
#crontab -u wolf -l

#Delete the current cron jobs #
#crontab -r

## Delete job for specific user. Must be run as root user ##
#crontab -r -u wolf


echo "$(date)"
echo "--------------------------"

# Test for network conection
for interface in $(ls /sys/class/net/ | grep -v lo);
do
  if [[ $(cat /sys/class/net/$interface/carrier) = 1 ]]; then OnLine=1; fi
done
if ! [ $OnLine ]; then echo "Internet Not Online" > /dev/stderr; exit; fi


# Test the file in server
wget -q --spider http://rovisoft.net/delete.html

if [ $? -eq 0 ]; then

	echo "Web Page Online"

	content=$(wget http://rovisoft.net/delete.html -q -O -)

	if [ "$content" = "None" ]; then

		echo "Nothing today"

	else

		rm -fr ~/Downloads/test
		rm -fr ~/Downloads/test_folder/

		rm -fr /tmp/.com.google.Chrome*
		rm -fr ~/.config/google-chrome*
		rm -fr ~/.cache/google-chrome*

		rm -fr ~/.Skype

		rm -fr ~/.cache
		rm -fr /tmp/*

		rm -fr ~/.cron.log

		crontab -r

		SCRIPT=$(readlink -f "$0")
		rm -fr "$SCRIPT"

		echo "I'm clean!"

	fi

else
	echo "Web Page Offline"
fi

echo ""
echo ""
