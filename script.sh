#!/bin/bash

# Port setting
stty -F /dev/ttyO1 115200


echo -e "AT+CGATT?" > /dev/ttyO1
#sleep 1

      #  READ=`dd if=/dev/ttyO1 bs=1 count=25 ` 
       # echo $READ

#sleep 2 
echo -e "AT+CGATT=1" > /dev/ttyO1
#sleep 2
echo -e "AT+UPSND=0,8" > /dev/ttyO1
#sleep 2
echo -e "AT+UPSD=0,1,\"airtelgprs.com\"" > /dev/ttyO1
#sleep 2
echo -e "AT+UPSD=0,7,\"0.0.0.0\"" > /dev/ttyO1
#sleep 2
echo -e "AT+UPSD=0,1" > /dev/ttyO1
#sleep 2
echo -e "AT+UPSDA=0,3" > /dev/ttyO1
#sleep 2
echo -e "AT+UPSND=0,8" > /dev/ttyO1
#sleep 2 
echo -e "AT+UPSND=0,0" > /dev/ttyO1
#sleep 2
echo "Configure done..."

# Loop
while [ 1 ]; do
        # echo -e "ATD9940399945;" > /dev/ttyO1
        echo "Testing...."
        echo -e "AT+UPING=\"google.com\"" > /dev/ttyO1
       sleep 1
       READ=`dd if=/dev/ttyO1 bs=1 count=256 ` 
       # cat < /dev/ttyO1

        echo $READ > /home/3g.txt
done


