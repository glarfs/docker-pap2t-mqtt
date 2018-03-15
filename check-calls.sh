#!/bin/bash
BROKER="${PAP2T_MQTT_HOST:=192.168.1.1}"
PORT=${PAP2T_MQTT_HOST:=1883}
ENDPOINT="${PAP2T_MQTT_ENTRYPOINT:=/test/phone}"
PAP="${PAP2T_HOST:=192.168.1.10}"
TEXT=`curl --silent $PAP |grep -oP '(Call 1 State|Last Caller Number):<td><font color="darkblue">\w*' - | sed -e 's/<td><font color="darkblue">//g' | head -n2`
LAST_PHONE=`echo "$TEXT" | head -n1 | sed -e "s/Last Caller Number://g"`
STATE=`echo "$TEXT" | tail -n1 | sed -e "s/Call 1 State://g"`
echo "$STATE"
if [ $STATE == 'Ringing' ]; then
        mosquitto_pub -h $BROKER  -t $ENDPOINT/last -m $LAST_PHONE -r
fi
mosquitto_pub -h $BROKER -t $ENDPOINT/status -m $STATE -r

