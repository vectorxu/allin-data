#!/usr/bin/python3
# -*- coding: utf-8 -*-


import pymysql




def get_table():
   db = pymysql.connect(host="123.57.69.57", user="readonly", password="9ciuBd!D", port=4417,
                        database="information_schema")

   database = "allin_platform"
   ods_pre = "ods_allin_"
   sql_tablename = "select table_name from information_schema.tables where table_schema='allin_platform' and table_type='base table';"
   cursor = db.cursor()
   # 执行SQL语句
   cursor.execute(sql_tablename)
   # 获取所有记录列表
   results = cursor.fetchall()
   for row in results:
      tablename = row[0]
      col = get_colume(tablename)

      addpar=\
         "!/bin/sh \n"\
         "\n"\
         "etl_date=`date -d -1day +%Y-%m-%d` \n"\
         "\n"\
         "sqoop import \\\n"\
         "--connect \"jdbc:mysql://10.171.102.213:4417/allin_platform?useUnicode=true&characterEncoding=utf-8&useSSL=false\" \\\n"\
         "--username slave_front \\\n"\
         "--password  'pWRIY58gNdCOp[yM' \\\n"\
         "--query \"select "+col+" from "+tablename+" where 1=1 AND \\$CONDITIONS\" \\\n"\
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
      #print (addpar)

      filename=ods_pre+tablename
      write_file(filename,addpar)



   # 关闭数据库连接
   db.close()


def get_colume(tablename):
   sql_columnname = "select COLUMN_NAME from information_schema.COLUMNS where table_name = \'" + tablename + "\';"
   db1 = pymysql.connect(host="123.57.69.57", user="readonly", password="9ciuBd!D", port=4417,
                        database="information_schema")
   cur = db1.cursor()
   cur.execute(sql_columnname)
   r = cur.fetchall()

   l=len(r)
   i=0
   c=""
   while (i < l):
      c=c+c.join(r[i])+","
      i=i+1
   d = c[:-1]
   return d
   db1.close()

def write_file(filename,file):
   path = "/Users/allin/PycharmProjects/allin-data/com/allin/tools/file"+filename
   f = open(path, 'w', encoding='utf-8')
   f.write(file)
   f.close()


if __name__ == '__main__':
   #get_colume("customer_auth")
   get_table()