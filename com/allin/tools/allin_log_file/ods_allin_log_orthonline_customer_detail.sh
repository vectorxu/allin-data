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
--query "select customer_id,customer_name,sex,nation,certificates,certificates_no,birth,medical_title,I,J,social_title,L,province,city,company,P,company2,level,nature,department,detail_address,zip_code,company_tele,mobile,email,areas_expertise,AA,AB,qualification_code,qualification_time,practicing_certificate,practicing_time,graduation_school,graduation_time,degree_name,education,graduation_school_2,graduation_time_2,degree_name_2,education_2,summary,part_time_job,level_id,create_time from orthonline_customer_detail where STR_TO_DATE(create_time,'%Y-%m-%d')='"""${etl_date}"""' and 1=1 AND \$CONDITIONS" \
--delete-target-dir \
--target-dir /user/hive/data/ods/allin_platform_log/ods_allin_log_orthonline_customer_detail/dt="${etl_date}" \
--num-mappers 1 \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_allin_log_orthonline_customer_detail add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi