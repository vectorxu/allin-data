#!/usr/bin/python3
# -*- coding: utf-8 -*-


import pymysql


def db_connect():
    db = pymysql.connect(host="101.201.140.170", user="dev", password="vXKGQ_7WrjVHRla8", port=4417,database="information_schema")
    cursor = db.cursor()
    return cursor
    db.close()


def get_table():
    cur=db_connect()
    database = "allin_platform_log"
    ods_pre = "ods_"
    sql_tablename = "select table_name,table_comment from information_schema.tables where table_schema=\'"+ database +"\' and table_type='base table';"

    # 执行SQL语句
    cur.execute(sql_tablename)
    # 获取所有记录列表
    results = cur.fetchall()
    for row in results:
        tablename = row[0]
        tablecomment=row[1]
        ddl=create_table_ddl(tablename,ods_pre,tablecomment,database)
        write_file(ddl,database)


def create_table_ddl(tablename,ods_pre,tablecomment,allin_platform):
    col = "select column_name,data_type,column_comment from information_schema.COLUMNS where table_name = \'" + tablename + "\';"
    cur = db_connect()
    cur.execute(col)
    results = cur.fetchall()
    col=""
    for row in results:
        col = col+"  `"+row[0]+"` "+ row[1]+" COMMENT \'"+row[2]+"\',\n"

    c = col.replace("varchar","string")
    c0 = c.replace("longtext","string")
    c1 = c0.replace(" text ", " string ")
    c2 = c1.replace(" char ", " string ")
    c3 = c2.replace(" longblob ", " string ")
    c4 = c3.replace("datetime", "timestamp")
    c5 = c4.replace(" set ", " string ")
    c6 = c5.replace(" enum ", " string ")
    c7 = c6.replace(" mediumtext ", " string ")
    c8 = c7.replace("\t", " ")
    c9 = c8.replace(" bit ", " int ")

    cols=c9[:-2]

    ddl="CREATE EXTERNAL TABLE IF NOT EXISTS `ods."+ods_pre+tablename+"` (\n" \
                ""+cols+"\n" \
                ") COMMENT \'"+tablecomment+"\'\n" \
                "PARTITIONED BY (\n" \
                "  `dt` string)\n" \
                "ROW FORMAT SERDE\n" \
                "  \'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe\'\n" \
                "WITH SERDEPROPERTIES (\n" \
                "  \'field.delim\'=\'\\001\',\n" \
                "  \'line.delim\'=\'\\n\',\n" \
                "  \'escape.delim\'=\'\\\\\',\n" \
                "  \'serialization.null.format\'=\'\')\n" \
                "STORED AS INPUTFORMAT\n" \
                "  \'org.apache.hadoop.mapred.TextInputFormat\'\n" \
                "OUTPUTFORMAT\n" \
                "  \'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat\'\n" \
                "LOCATION\n" \
                "  \'hdfs://allincluster/user/hive/data/ods/"+allin_platform+"/"+ods_pre+tablename+"\';\n" \
                "\n"

    return ddl

def write_file(file,database):
   path = "/Users/allin/PycharmProjects/allin-data/com/allin/tools/"+database+"_ddl.hql"
   f = open(path, 'a+', encoding='utf-8')
   f.write(file)
   f.close()

if __name__ == '__main__':
    get_table()
    # ddl=create_table_ddl("tocure_cms_activity_doctor","ods_","会员认证信息","tocure_platform")
    # print(ddl)