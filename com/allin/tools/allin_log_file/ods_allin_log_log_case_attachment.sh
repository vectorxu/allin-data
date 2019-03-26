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
--query "select id,case_id,case_att_name,case_category_id,case_att_type,case_att_size,case_att_format,case_att_spec,case_att_height,case_att_width,case_att_url,upload_time,sort_id,is_valid,dyna_height,dyna_width,send_site_id,op_date,op_usr,op_ip,op_address,op_desc,create_time from log_case_attachment where STR_TO_DATE(create_time,'%Y-%m-%d')='"""${etl_date}"""' and 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from log_case_attachment" \
--delete-target-dir \
--target-dir /user/hive/data/ods/allin_platform_log/ods_allin_log_log_case_attachment/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_allin_log_log_case_attachment add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi