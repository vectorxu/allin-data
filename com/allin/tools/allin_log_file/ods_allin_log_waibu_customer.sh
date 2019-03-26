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
--query "select id,提交答卷时间,所用时间,来自IP,来源渠道,1,2,3,4,5,K,2、您的年手术量是多少？,3、您目前主要做的是？,4、您目前最想得到的学习资源是？,5、您平时每周花在阅读文献的时间大概有多少？,6、您愿意使用以下何种方式阅读医学杂志？,7、阅读文献的时候， 您希望能够看到中英文两个版本么？,8、截至目前为止， 您（或所在的单位/科室）一共收到几期JOA中文版 ？,9、您认为JOA对您的工作是否有帮助？,10、对于JOA或唯医网，您还有其他建议吗？,11、你愿意加入joa中文版电子版读者群吗（如果“愿意”，请在下一题填写您的邮箱）？,12、如果您愿意加入joa中文版电子版读者群，请填写您的邮箱： from waibu_customer where STR_TO_DATE(create_time,'%Y-%m-%d')='"""${etl_date}"""' and 1=1 AND \$CONDITIONS" \
--split-by id \
--boundary-query "select min(id),max(id) from waibu_customer" \
--delete-target-dir \
--target-dir /user/hive/data/ods/allin_platform_log/ods_allin_log_waibu_customer/dt="${etl_date}" \
--null-string '\\N' \
--null-non-string '\\N' \
--fields-terminated-by '\001' \
--lines-terminated-by '\n' \
--hive-drop-import-delims \
--m 2 \

if [ $? -eq 0 ];then
    hive -e "alter table ods.ods_allin_log_waibu_customer add if not exists partition(dt='"""${etl_date}"""');"
else
    exit 1
fi