#!/bin/sh

etl_date=`date -d -1day +%Y-%m-%d`

host=`sudo cat sqoop_microservice_to_ods.conf | grep patienteducation_host | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
port=`sudo cat sqoop_microservice_to_ods.conf | grep patienteducation_port | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
user=`sudo cat sqoop_microservice_to_ods.conf | grep patienteducation_user | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
password=`sudo cat sqoop_microservice_to_ods.conf | grep patienteducation_password | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
database=`sudo cat sqoop_microservice_to_ods.conf | grep patienteducation_database | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`

sqoop import \
--connect "jdbc:mysql://${host}:${port}/${database}?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&useSSL=false" \
--username ${user} \
--password ${password} \
--query "select id,manual_id,manual_name,adapt_crowd,experts_say,recommender,author_id,author_name,open_state,state,browse_num,collection_num,share_num,reprint_num,is_valid,sort_id,last_update_time,create_time,is_view_flag,source_type,is_classify,site_id,operator_id,operator_name,operator_time from cms_manual where 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from cms_manual" \
--delete-target-dir \
--target-dir /user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_manual/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_patienteducation_cms_manual add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi