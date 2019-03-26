#!/bin/sh

etl_date=`date -d -1day +%Y-%m-%d`

host=`sudo cat sqoop_med_to_ods.conf | grep host | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
port=`sudo cat sqoop_med_to_ods.conf | grep port | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
user=`sudo cat sqoop_med_to_ods.conf | grep user | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
password=`sudo cat sqoop_med_to_ods.conf | grep password | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
database=`sudo cat sqoop_med_to_ods.conf | grep database | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`

sqoop import \
--connect "jdbc:mysql://${host}:${port}/${database}?useUnicode=true&characterEncoding=utf-8&useSSL=false" \
--username ${user} \
--password ${password} \
--query "select id,customer_id,session_id,search_type,search_url,key_word,create_time,op_ip,op_address,site_id,is_valid from log_med_customer_keyword where 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from log_med_customer_keyword" \
--delete-target-dir \
--target-dir /user/hive/data/ods/med_platform_log/ods_log_med_customer_keyword/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_log_med_customer_keyword add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi