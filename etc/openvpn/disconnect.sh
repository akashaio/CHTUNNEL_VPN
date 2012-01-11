#!/bin/bash
DB_USER="chtunnel_vpn"
DB_PASSWD="chtunnel_vpn"
DB_TABLE="chtunnel_vpn"
#set status ofline to user disconnected
mysql -u$DB_USER -p$DB_PASSWD -e "UPDATE user_detail SET user_status=0,user_ip_last=NULL WHERE user_detail.user_id='$common_name'" $DB_TABLE
#insert data disconnected to table log 
mysql -u$DB_USER -p$DB_PASSWD -e "UPDATE log SET log_end_time=now(),log_received_bytes=$bytes_received,log_sent_bytes=$bytes_sent WHERE log_trusted_ip='$trusted_ip' AND log_trusted_port=$trusted_port AND log_remote_ip='$ifconfig_pool_remote_ip' AND user_id='$common_name' AND log_end_time='0000-00-00 00:00:00'" $DB_TABLE
#set user enable = 0 when today not time
mysql -u$DB_USER -p$DB_PASSWD -e "UPDATE user_detail SET user_enable=0 WHERE (( user_detail.user_id='$common_name' ) and ((user_detail.user_start_date = user_detail.user_end_date) or ((TO_DAYS(now()) < TO_DAYS(user_detail.user_start_date)) or (TO_DAYS(now()) > TO_DAYS(user_detail.user_end_date)))))" $DB_TABLE