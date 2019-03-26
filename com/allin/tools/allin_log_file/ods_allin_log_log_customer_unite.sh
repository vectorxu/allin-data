#!/bin/sh

etl_date=`date -d -1day +%Y-%m-%d`

host=`sudo cat sqoop_allin_log_to_ods.conf | grep allin_log_host | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
port=`sudo cat sqoop_allin_log_to_ods.conf | grep allin_log_port | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
user=`sudo cat sqoop_allin_log_to_ods.conf | grep allin_log_user | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
password=`sudo cat sqoop_allin_log_to_ods.conf | grep allin_log_password | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
database=`sudo cat sqoop_allin_log_to_ods.conf | grep allin_log_database | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`

sqoop import \
--connect "jdbc:mysql://${host}:${port}/${database}?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&useSSL=false" \
--username ${user} \
--password ${password} \
--query "select id,ref_unite_id,customer_id,nickname,m_tele,e_mail,unite_id_qq,unite_name_qq,unite_flag_qq,unite_id_sina,unite_name_sina,unite_flag_sina,unite_id_baidu,unite_name_baidu,unite_flag_baidu,passwd,op_date,op_usr,op_ip,op_address,op_source,op_desc,is_valid,is_check_email,is_check_mobile,customer_role,mobile,unite_time_mobile,email,unite_time_email,unite_time_qq,unite_time_sina,unite_time_baidu,unite_id_weixin,unite_name_weixin,unite_flag_weixin,unite_time_weixin,unite_id_caos,unite_name_caos,unite_flag_caos,unite_time_caos,check_email_time,check_mobile_time,unite_name_zhgk,unite_time_zhgk,init_passwd,send_site_id,create_time from log_customer_unite where STR_TO_DATE(create_time,'%Y-%m-%d')='"""${etl_date}"""' and 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from log_customer_unite" \
--delete-target-dir \
--target-dir /user/hive/data/ods/allin_platform_log/ods_allin_log_log_customer_unite/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_allin_log_log_customer_unite add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi