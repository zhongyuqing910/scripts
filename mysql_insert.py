
import MySQLdb
import xlrd
import time
import sys
reload(sys)


def get_table():
    file_name = 'user.xlsx'
    data = xlrd.open_workbook(file_name)
    table = data.sheets()[0]
    return table


def insert_by_loop(table):
    nrows = table.nrows
    for i in xrange(1, nrows):
        param = []
        try:
            sql = "insert into asset_hostlist values(%s,%s,%s,%s,%s,%s,%s,%s)"
            print 'Insert: ',table.cell(i,0).value, table.cell(i,1).value, table.cell(i,2).value
            param = (table.cell(i,0).value,table.cell(i,1).value,table.cell(i,2).value,table.cell(i,3).value,table.cell(i,4).value,table.cell(i,5).value,table.cell(i,6).value,table.cell(i,7).value)
            cur.execute(sql,param)
            conn.commit()
        except Exception as e:
            print e
            conn.rollback()

conn = MySQLdb.connect(host="127.0.0.1",port = 3306,user = "root",passwd = "SA123456",db = "oms")
cur = conn.cursor()


'''sql = """create table user001(
          username char(255) not null,
          salt char(255),
          pwd char(255)
     )"""
cur.execute(sql)'''

table = get_table()

start = time.clock()
insert_by_loop(table)
end = time.clock()
print '[insert_by_loop execute] Time Usage:',end-start
