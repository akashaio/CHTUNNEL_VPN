#!/bin/bash
DB_USER="chtunnel_vpn"
DB_PASSWD="chtunnel_vpn"
DB_TABLE="chtunnel_vpn"
#disble last ip if not NULL
IP=$(mysql --skip-column-names -u$DB_USER -p$DB_PASSWD -e "SELECT user_ip_last FROM user_detail WHERE user_id='$common_name'" $DB_TABLE)
if [ "$IP" != 'NULL' ]
then
  OLD_REMOTE_IP=`echo "$IP" | awk -F':' '{print $1}'`
  OLD_PROTOCAL=`echo "$IP" | awk -F':' '{print $2}'`
  OLD_IP=`echo "$IP" | awk -F':' '{print $3}'`
  OLD_PORT=`echo "$IP" | awk -F':' '{print $4}'`
  KILL_IP="$OLD_IP:$OLD_PORT"
  if [ "$OLD_REMOTE_IP" != "$REMOTE_IP" ]
  then
    if [ "$OLD_PROTOCAL" = "udp" ]
    then
      /etc/openvpn/kill_udp.sh "$KILL_IP"
    else
      /etc/openvpn/kill_tcp.sh "$KILL_IP"
    fi
  fi
fi
#insert data connection to table log 
mysql -u$DB_USER -p$DB_PASSWD -e "INSERT INTO log (user_id,log_trusted_ip,log_trusted_port,log_start_time,log_remote_ip,log_protocol) VALUES('$common_name','$trusted_ip','$trusted_port',now(),'$ifconfig_pool_remote_ip','$proto_1')" $DB_TABLE
#set status online to user connected
LAST_IP="$ifconfig_pool_remote_ip:$proto_1:$trusted_ip:$trusted_port"
mysql -u$DB_USER -p$DB_PASSWD -e "UPDATE user_detail SET user_status=1,user_ip_last='$LAST_IP' WHERE user_detail.user_id='$common_name'" $DB_TABLE
