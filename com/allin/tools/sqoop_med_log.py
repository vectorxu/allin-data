#!/usr/bin/python3
# -*- coding: utf-8 -*-


import pymysql


# 生成sqoop语句
def get_table():
    db = pymysql.connect(host="wwyiding2016.mysql.rds.aliyuncs.com", user="dev_ops", password="SkGHWdYQ2ZbiGyBJ", port=3317,database="information_schema")

    database = "med_platform_log"
    ods_pre = "ods_"
    sql_tablename = "select table_name from information_schema.tables where table_schema=\'"+database+"\' and table_type='base table';"
    cursor = db.cursor()
    # 执行SQL语句
    cursor.execute(sql_tablename)
    # 获取所有记录列表
    results = cursor.fetchall()
    for row in results:
        tablename = row[0]
        col = get_colume(tablename)

        addpar=\
           "#!/bin/sh\n"\
           "\n"\
           "etl_date=`date -d -1day +%Y-%m-%d`\n" \
           "\n" \
           "host=`sudo cat sqoop_med_to_ods.conf | grep host | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`\n"\
           "port=`sudo cat sqoop_med_to_ods.conf | grep port | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`\n"\
           "user=`sudo cat sqoop_med_to_ods.conf | grep user | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`\n" \
           "password=`sudo cat sqoop_med_to_ods.conf | grep password | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`\n" \
           "database=`sudo cat sqoop_med_to_ods.conf | grep database | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`\n"\
           "\n"\
           "sqoop import \\\n"\
           "--connect \"jdbc:mysql://${host}:${port}/${database}?useUnicode=true&characterEncoding=utf-8&useSSL=false\" \\\n"\
           "--username ${user} \\\n"\
           "--password ${password} \\\n"\
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
           "--m 2 \\\n"\
           "\n" \
           "if [ $? -eq 0 ];then\n" \
           "    hive -e \"alter table ods."+ods_pre+tablename+" add if not exists partition(dt=\'"+"\"\"\"${etl_date}\"\"\"\'"+");\"\n" \
           "else\n" \
           "    exit 1\n" \
           "fi" \
            #print (addpar)

        # sqoop 文件
        filename=ods_pre+tablename+".sh"
        write_file(filename,addpar)


        # job文件
        jobfilename=ods_pre+tablename+".job"
        file=\
           "type=command\n"\
           "command=sh "+filename+"\n"\
           "dependencies=start"
        #print(file)
        write_file(jobfilename, file)

        #打印end依赖
        #print(""+ods_pre+tablename+",")


    # 关闭数据库连接
    db.close()

# 生成表的字段
def get_colume(tablename):
   sql_columnname = "select COLUMN_NAME from information_schema.COLUMNS where table_name = \'" + tablename + "\';"
   db1 = pymysql.connect(host="wwyiding2016.mysql.rds.aliyuncs.com", user="dev_ops", password="SkGHWdYQ2ZbiGyBJ",port=3317, database="information_schema")
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
   path = "/Users/allin/PycharmProjects/allin-data/com/allin/tools/med_log_file/"+filename
   f = open(path, 'w', encoding='utf-8')
   f.write(file)
   f.close()


if __name__ == '__main__':
    # q=get_colume("tocure_cms_activity_doctor")
    # print(q)

    get_table()