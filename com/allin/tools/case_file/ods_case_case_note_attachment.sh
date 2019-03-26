#!/bin/sh

etl_date=`date -d -1day +%Y-%m-%d`

host=`sudo cat sqoop_case_to_ods.conf | grep host | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
port=`sudo cat sqoop_case_to_ods.conf | grep port | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
user=`sudo cat sqoop_case_to_ods.conf | grep user | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
password=`sudo cat sqoop_case_to_ods.conf | grep password | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
database=`sudo cat sqoop_case_to_ods.conf | grep database | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`

sqoop import \
--connect "jdbc:mysql://${host}:${port}/${database}?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&useSSL=false" \
--username ${user} \
--password ${password} \
--query "select id,note_id,note_video_id,att_name,att_type,att_size,att_format,att_spec,att_height,att_width,att_url,sort_id,site_id,qiniu_id,qiniu_status,is_qiniu,play_num,play_time,is_valid,create_time,update_time from case_note_attachment where 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from case_note_attachment" \
--delete-target-dir \
--target-dir /user/hive/data/ods/case_platform/ods_case_case_note_attachment/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_case_case_note_attachment add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi