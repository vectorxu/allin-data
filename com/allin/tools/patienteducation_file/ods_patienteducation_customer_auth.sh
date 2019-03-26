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
--query "select id,customer_id,auth_date,first_name,last_name,certificates_id,certificates_code,certificates_path,qualification_code,qualification_path,company_id,company,department,areas_expertise,medical_title_id,medical_title,social_title,degree_certificate_code,degree_certificate_path,school_id,school_name,major_id,major_name,degree_id,degree_name,state,clinical_time,send_site_id,first_name_en,last_name_en,medical_title_en,company_en,full_name,platform_id,create_time,birth_year,clinical_year,yesteryear_operation_num,precedingyear_operation_num,illness_id_list,base_id,base_name,receive_state,practice_auth_time,doctor_type,update_time from customer_auth where 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from customer_auth" \
--delete-target-dir \
--target-dir /user/hive/data/ods/patienteducation_platform/ods_patienteducation_customer_auth/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_patienteducation_customer_auth add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi