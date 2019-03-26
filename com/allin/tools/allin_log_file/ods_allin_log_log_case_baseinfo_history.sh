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
--query "select id,case_id,case_name,ref_customer_id,sex_id,age,areas_expertise,main_narrate,illness_history,professional_checking,discussion,collection_num,follow_fans_num,review_num,reprint_num,share_num,create_time,moidfy_time,publish_time,sort_id,is_valid,case_status,reason,is_customer_essential,is_header,last_update_time,web_storage_path,page_storage_path,case_url,tpl_path,prefer_up_num,browse_num,send_site_id,sort_list_authority,age_month,age_day,sort_authority_secondary,op_date,op_usr,op_ip,op_address,op_desc,is_draft,activity_id,activity_status,platform_id,score,score_num from log_case_baseinfo_history where STR_TO_DATE(create_time,'%Y-%m-%d')='"""${etl_date}"""' and 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from log_case_baseinfo_history" \
--delete-target-dir \
--target-dir /user/hive/data/ods/allin_platform_log/ods_allin_log_log_case_baseinfo_history/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_allin_log_log_case_baseinfo_history add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi