#!/usr/bin/python3
# -*- coding: utf-8 -*-


import pymysql
import datetime

def ddl_create_partition():
    begin = datetime.date(2016,3,5)
    end = datetime.date(2019,4,28)
    for i in range((end - begin).days+1):
        day = begin + datetime.timedelta(days=i)

        #ddl="alter table ods.ods_allin_log_track add if not exists partition(history=1,dt=\'"+str(day)+"\');"
        #ddl = "alter table ods.ods_tocure_log_track_origin add if not exists partition(history=1,dt=\'" + str(day) + "\');"
        ddl = "alter table ods.ods_tocure_log_customer_browse_origin add if not exists partition(dt=\'" + str(day) + "\');"


        print(ddl)

if __name__ == '__main__':
    ddl_create_partition()



