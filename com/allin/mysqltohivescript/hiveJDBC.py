#!/usr/bin/python3
# -*- coding: utf-8 -*-

from pyhive import hive
conn = hive.Connection(host='39.96.4.143', port=10001, username='hadoop', auth="NOSASL", database='ods')
cursor = conn.cursor()
cursor.execute('show database')

for result in cursor.fetchall():
    print(result)