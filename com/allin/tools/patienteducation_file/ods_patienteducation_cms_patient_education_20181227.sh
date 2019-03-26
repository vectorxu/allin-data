#!/bin/sh

etl_date=`date -d -1day +%Y-%m-%d`

host=`sudo cat sqoop_microservice_to_ods.conf.conf | grep patienteducation_host | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
port=`sudo cat sqoop_microservice_to_ods.conf.conf | grep patienteducation_port | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
user=`sudo cat sqoop_microservice_to_ods.conf.conf | grep patienteducation_user | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
password=`sudo cat sqoop_microservice_to_ods.conf.conf | grep patienteducation_password | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
database=`sudo cat sqoop_microservice_to_ods.conf.conf | grep patienteducation_database | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`

sqoop import \
--connect "jdbc:mysql://${host}:${port}/${database}?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&useSSL=false" \
--username ${user} \
--password ${password} \
--query "select id,education_id,education_name,education_type,education_desc,ref_customer_id,browse_num,review_num,share_num,status,last_update_time,create_time,source_id,sort_id,is_valid,collection_num,reprint_num,prefer_up_num,education_content_type,page_storage_path,web_storage_path,app_storage_path,tpl_path,part_id_list,major_id_list,illness_id_list,operation_id_list,illness_state_id_list,illness_state,is_recommend,is_reprint,ill_id_list,illness_unite_id_list,band_customer_time from cms_patient_education_20181227 where 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from cms_patient_education_20181227" \
--delete-target-dir \
--target-dir /user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_patient_education_20181227/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_patienteducation_cms_patient_education_20181227 add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi