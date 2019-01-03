#!/usr/bin/python3
# -*- coding: utf-8 -*-


import pymysql


# 打开数据库连接
db = pymysql.connect(host="123.57.69.57",user="readonly",password="9ciuBd!D",port=4417,database="information_schema")
# 使用cursor()方法获取操作游标
cursor = db.cursor()


# 库名
database="allin_platform"
# ods表名前缀
ods_pre="ods_allin_"

# SQL 查询语句
sql_tablename = "select table_name from information_schema.tables where table_schema='allin_platform' and table_type='base table';"

try:
   # 执行SQL语句
   cursor.execute(sql_tablename)
   # 获取所有记录列表
   results = cursor.fetchall()
   for row in results:
      tablename = row[0]

       # 打印结果
      addpar=\
         "!/bin/sh \n"\
         "\n"\
         "etl_date=`date -d -1day +%Y-%m-%d` \n"\
         "\n"\
         "sqoop import \\\n"\
         "--connect \"jdbc:mysql://10.171.102.213:4417/allin_platform?useUnicode=true&characterEncoding=utf-8&useSSL=false\" \\\n"\
         "--username slave_front \\\n"\
         "--password  'pWRIY58gNdCOp[yM' \\\n"\
         "--query \"select from "+tablename+" where 1=1 AND \\$CONDITIONS\" \\\n"\
         "--split-by id \\\n"\
         "--boundary-query \"select min(id),max(id) from "+tablename+"\" \\\n"\
         "--delete-target-dir \\\n"\
         "--target-dir /user/hive/data/ods/"+database+"/"+ods_pre+tablename+"/dt=\"${etl_date}\" \\\n"\
         "--null-string \'\\\\N\' \\\n"\
         "--null-non-string \'\\\\N\' \\\n"\
         "--fields-terminated-by \'\\001\' \\\n"\
         "--lines-terminated-by \'\\n\' \\\n"\
         "--hive-drop-import-delims \\\n"\
         "--m 5 \\\n"\
         "--compress \\\n"\
         "--compression-codec com.hadoop.compression.lzo.LzopCodec\n"\
         "\n" \
         "hive -e \"alter table ods."+ods_pre+tablename+"add if not exists partition(dt=\'"+"\"\"\"${etl_date}\"\"\"\'"+");\""
      print (addpar)

except:
   print ("Error: unable to fecth data")

# 关闭数据库连接
db.close()

