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
--query "select id,structure_id,template_id,field_id,structure_name,is_copy,parent_id,tree_level,is_leaf,full_path,default_value,create_time,update_time,site_id,sort_id,is_valid,is_both_sides,field_type from case_folder_template_structure where 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from case_folder_template_structure" \
--delete-target-dir \
--target-dir /user/hive/data/ods/case_platform/ods_case_case_folder_template_structure/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_case_case_folder_template_structure add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi