#!/usr/bin/python
# -*- coding: utf-8 -*-


# sys.setdefaultencoding('utf8')

import sys

# Python3 需要引入
# from imp import reload
# # 加载之前加载过的模块
# reload(sys)

import json

for line in sys.stdin:
        try:
            cols = line.strip().split('\t')
            col_dict={}
            for col in cols:

                col_dict.update(col)
                print(col_dict)
                json_str = json.dumps(col_dict)
        except Exception as e:
                json_str = '{}'
        finally:
                print(json_str)
