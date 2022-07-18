import pymssql


db = pymssql.connect(".", "sa", "123456", "plastic data")
cursor = db.cursor()

i = 1990
while i <= 2019:
    tableName = 'edata' + str(i) 
    
    sql1 = "delete from %s" % tableName + " where rtCode = ptCode"
    cursor.execute(sql1)
    db.commit()
    i = i + 1

print("OK")
