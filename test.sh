stty -F /dev/ttyO1 115200

echo "AT" > /dev/ttyO1



cat < /dev/ttyO1 


echo -e "AT+CGATT?" > /dev/ttyO1
echo -e "AT+CGATT=1" > /dev/ttyO1
echo -e "AT+UPSND=0,8" > /dev/ttyO1
echo -e "AT+UPSD=0,1,airtelgprs.com" > /dev/ttyO1
echo -e "AT+UPSD=0,7,0.0.0.0" > /dev/ttyO1
echo -e "AT+UPSD=0,1" > /dev/ttyO1
echo -e "AT+UPSDA=0,3" > /dev/ttyO1
echo -e "AT+UPSND=0,8" > /dev/ttyO1
echo -e "AT+UPSND=0,0" > /dev/ttyO1
echo -e "AT+UPING=google.com"" > /dev/ttyO1



