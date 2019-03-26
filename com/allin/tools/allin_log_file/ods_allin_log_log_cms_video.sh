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
--query "select id,video_id,video_name,video_type,video_ebook_catagory,video_author,video_translator,video_source,video_abstract,video_status,video_url,video_logo_url,page_storage_path,ref_customer_id,create_time,publish_time,note_num,topic_num,follow_num,play_num,collection_num,review_num,reprint_num,share_num,prefer_up_num,video_score,is_customer_essential,is_sys_essential,is_header,sort_id,is_valid,web_storage_path,last_update_time,play_time,tpl_path,send_site_id,sort_list_authority,sort_authority_secondary,op_date,op_usr,op_ip,op_address,op_desc,qiniu_id,qiniu_status,is_qiniu,activity_id,activity_status,approval_status,approval_reason,qrcode_url,platform_id,score,score_num from log_cms_video where STR_TO_DATE(create_time,'%Y-%m-%d')='"""${etl_date}"""' and 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from log_cms_video" \
--delete-target-dir \
--target-dir /user/hive/data/ods/allin_platform_log/ods_allin_log_log_cms_video/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_allin_log_log_cms_video add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi