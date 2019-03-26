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
--query "select id,con_id,con_sub_name,con_sub_place,con_sub_intro,con_host,start_time,end_time,sort_id,is_valid,live_id,play_back_id,is_online,authority,authcode,con_sub_type,con_sub_pic_url,con_sub_web_url,con_sub_room,online_short_link,back_short_link,online_long_link,back_long_link from conference_sub where 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from conference_sub" \
--delete-target-dir \
--target-dir /user/hive/data/ods/med_platform_log/ods_conference_sub/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_conference_sub add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi