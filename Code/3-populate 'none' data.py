import pymssql


db = pymssql.connect(".", "sa", "123456", "plastic data")
cursor = db.cursor()

i = 1990
while i <= 2019:
    tableName = 'edata' + str(i)
    print('begin populate %s data'%tableName)
    sql1 = "update %s" % tableName + " set TradeQuantity = 0 where TradeQuantity is null"
    sql2 = "update %s" % tableName + " set NetWeight = 0 where NetWeight is null"
    sql3 = "update %s" % tableName + " set TradeValue = 0 where TradeValue is null"

    cursor.execute(sql1)
    db.commit()
    cursor.execute(sql2)
    db.commit()
    cursor.execute(sql3)
    db.commit()
    i = i + 1

print('OK')
