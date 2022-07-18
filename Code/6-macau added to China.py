# -*- coding: utf-8 -*-


import pymssql

hsCodes=[392321,392329]
for hsCode in hsCodes:
    print("begin %d process data"%hsCode)
    
    year=1990
    while year <= 2019:
        db = pymssql.connect(".", "sa", "123456", "plastic data")
        cursor = db.cursor()
        tableName = 'edata'+str(year) 
        print('begin  '+tableName)
        
        # first delete the link between Macau and China
        sql0 =  "delete from %s " % tableName + " where (rtCode = 446 and ptCode = 156) or (rtCode = 156 and ptCode = 446) " 
        cursor.execute(sql0)
        db.commit()
        sql1 = "select * from %s " % tableName + " where rtCode = 446 or ptCode = 446" + " and cmdCode=%d"%hsCode +" and period=%s"%str(year)
        cursor.execute(sql1)
        MacaoData = cursor.fetchall()

        for it in MacaoData:
            
            if it[8] == '446':#it[8]:rtCode
                # sql2 = "select * from %s" % tableName + " where rtCode = 156 and ptCode = %s" % it[11] + " and rgDesc = '%s'" % it[7] +" and cmdCode=%d"%hsCode
                # cursor.execute(sql2)
                # ChinaData = cursor.fetchone()
                # if ChinaData:
                #     TradeQuanti = int(it[18]) + int(ChinaData[18])
                #     NetWeight = int(it[20]) + int(ChinaData[20])
                #     TradeValue = int(it[22]) + int(ChinaData[22])
                #     sql3 = "UPDATE %s" % tableName + " SET TradeQuantity = %s" % TradeQuanti + ",NetWeight = %s" % NetWeight + ",TradeValue = %s" % TradeValue + " WHERE id = %s" % ChinaData[0]+" and cmdCode=%d"%hsCode
                #     sql4 = "delete from %s" % tableName + " where id = %s" % it[0]+" and cmdCode=%d"%hsCode
                #     cursor.execute(sql3)
                #     db.commit()
                #     cursor.execute(sql4)
                #     db.commit()
                # else:
                #     sql5 = "select * from %s" % tableName + " where ptCode = 156 and rtCode = %s" % it[11] + " and rgDesc != '%s'" % it[7] +" and cmdCode=%d"%hsCode
                #     cursor.execute(sql5)
                #     ExistData = cursor.fetchone()
                #     if ExistData:
                #         TradeQuanti = int(it[18]) + int(ExistData[18])
                #         NetWeight = int(it[20]) + int(ExistData[20])
                #         TradeValue = int(it[22]) + int(ExistData[22])
                #         sql6 = "UPDATE %s" % tableName + " SET TradeQuantity = %s" % TradeQuanti + ",NetWeight = %s" % NetWeight + ",TradeValue = %s" % TradeValue + " WHERE id = %s" % ExistData[0]+" and cmdCode=%d"%hsCode
                #         sql7 = "delete from %s" % tableName + " where id = %s" % it[0]+" and cmdCode=%d"%hsCode
                #         cursor.execute(sql6)
                #         db.commit()
                #         cursor.execute(sql7)
                #         db.commit()
                #     else:
                sql8 = "UPDATE %s" % tableName + " SET rtCode = 156,rtTitle = 'China',rt3ISO = 'CHN' WHERE id = %s" % it[0] 
                cursor.execute(sql8)
                db.commit()

            if it[11] == '446':#it[11]:ptcode
                # sql2 = "select * from %s" % tableName + " where ptCode = 156 and rtCode = %s" % it[8] + " and rgDesc = '%s'" % it[7]+" and cmdCode=%d"%hsCode
                # cursor.execute(sql2)
                # ChinaData = cursor.fetchone()
                # if ChinaData:
                #     # print(tableName)
                #     # print(it)
                #     # print(ChinaData)
                #     TradeQuanti = int(it[18]) + int(ChinaData[18])
                #     NetWeight = int(it[20]) + int(ChinaData[20])
                #     TradeValue = int(it[22]) + int(ChinaData[22])
                #     sql3 = "UPDATE %s" % tableName + " SET TradeQuantity = %s" % TradeQuanti + ",NetWeight = %s" % NetWeight + ",TradeValue = %s" % TradeValue + " WHERE id = %s" % ChinaData[0]+" and cmdCode=%d"%hsCode
                #     sql4 = "delete from %s" % tableName + " where id = %s" % it[0]+" and cmdCode=%d"%hsCode
                #     cursor.execute(sql3)
                #     db.commit()
                #     cursor.execute(sql4)
                #     db.commit()
                # else:
                #     sql5 = "select * from %s" % tableName + " where rtCode = 156 and ptCode = %s" % it[8] + " and rgDesc != '%s'" % it[7] +" and cmdCode=%d"%hsCode
                #     cursor.execute(sql5)
                #     ExistData = cursor.fetchone()
                #     if ExistData:
                #         TradeQuanti = int(it[18]) + int(ExistData[18])
                #         NetWeight = int(it[20]) + int(ExistData[20])
                #         TradeValue = int(it[22]) + int(ExistData[22])
                #         sql6 = "UPDATE %s" % tableName + " SET TradeQuantity = %s" % TradeQuanti + ",NetWeight = %s" % NetWeight + ",TradeValue = %s" % TradeValue + " WHERE id = %s" % ExistData[0]+" and cmdCode=%d"%hsCode
                #         sql7 = "delete from %s" % tableName + " where id = %s" % it[0]+" and cmdCode=%d"%hsCode
                #         cursor.execute(sql6)
                #         db.commit()
                #         cursor.execute(sql7)
                #         db.commit()
                #     else:
                sql9 = "UPDATE %s" % tableName + " SET ptCode = 156,PtTitle = 'China',pt3ISO = 'CHN' WHERE id = %s" % it[0]
                cursor.execute(sql9)
                db.commit()
        db.close()
        print(str(year)+" done")        
        year+=1
        
print("OK")
