
# {"movie" :"1193" ,"rate" :"5" ,"timeStamp" :"978300760" ,"uid" :"1"}
#1193,5,978300760,1


import sys
import datetime
for line in sys.stdin:
    #获取每一行的内容并去掉头尾的空格
    line = line.strip()
    #根据换行符截取对应的字段
    movie,rate,timeinfo,userid = line.split(',')
    #将timeinfo转成时间格式
    weekday = datetime.datetime.fromtimestamp(float(timeinfo)).isoweekday()
    #重新拼接拼接新的内容并加入换行符
    print('\t'.join([movie, rate, str(weekday),userid]))



