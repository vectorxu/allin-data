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
--query "select id,customer_id,session,location_id,channel_id,column_id,recommend_id,ad_id,ad_position,trigger_type,trigger_name,action_id,param,ref_id,ref_type,src_location,to_location,op_ip,ip_org,area_code,city,country_code,country_name,latitude,longitude,postal_code,region,time_zone,pro_version,os_version,t_version,net_version,telecom,create_time,site_id from log_med_track_history where 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from log_med_track_history" \
--delete-target-dir \
--target-dir /user/hive/data/ods/med_platform_log/ods_log_med_track_history/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_log_med_track_history add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi