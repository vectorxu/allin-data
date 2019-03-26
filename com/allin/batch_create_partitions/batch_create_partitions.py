#!/usr/bin/python3
# -*- coding: utf-8 -*-


import pymysql
import datetime

def ddl_create_partition():
    begin = datetime.date(2018,4,9)
    end = datetime.date(2019,1,1)
    for i in range((end - begin).days+1):
        day = begin + datetime.timedelta(days=i)

        #ddl="alter table ods.ods_allin_log_track add if not exists partition(history=1,dt=\'"+str(day)+"\');"
        ddl = "alter table ods.ods_allin_log_push add if not exists partition(history=1,dt=\'" + str(day) + "\');"

        print(ddl)

if __name__ == '__main__':
    ddl_create_partition()



