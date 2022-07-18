import pymssql


db = pymssql.connect(".", "sa", "123456", "plastic data")
cursor = db.cursor()
hsCodes=[392321,392329]
for hsCode in hsCodes:
    print("start processing the data with code %d" %hsCode)
    year=1990
    while year <= 2019:
        tableName = 'edata' + str(year) 
        print("begin  %s"%year)
        # Hongkong re-export:rtCode=344
        # sql8 = "select * from %s" % tableName + " where rtCode = 344 and rgCode = 3" +" and cmdCode=%d"%hsCode#rgCode:re-exports再出口
        # cursor.execute(sql8)
        # result8 = cursor.fetchall()

        # for it in result8:
        #     sql9 = "select * from %s" % tableName + " where rtCode = 344 and rgCode = 2 and ptCode = %s" % it[11]+" and cmdCode=%d"%hsCode
        #     cursor.execute(sql9)
        #     result9 = cursor.fetchone()

        #     if result9:
        #         TradeQuanti = int(it[18]) + int(result9[18])
        #         NetWeight = int(it[20]) + int(result9[20])
        #         TradeValue = int(it[22]) + int(result9[22])
        #         sql10 = "UPDATE %s" % tableName + " SET TradeQuantity = %s" % TradeQuanti + ",NetWeight = %s" % NetWeight + ",TradeValue = %s" % TradeValue + " WHERE id = %s" % result9[0]
        #         sql11 = "delete from %s" % tableName + " where id = %s" % it[0]
        #         cursor.execute(sql10)
        #         db.commit()
        #         cursor.execute(sql11)
        #         db.commit()

        # Hongkong reimport: rtCode=344
        # sql12 = "select * from %s" % tableName + " where rtCode = 344 and rgCode = 4"+" and cmdCode=%d"%hsCode#re-imports再进口
        # cursor.execute(sql12)
        # result12 = cursor.fetchall()

        # for it in result12:
        #     sql13 = "select * from %s" % tableName + " where rtCode = 344 and rgCode = 1 and ptCode = %s" % it[11]+" and cmdCode=%d"%hsCode
        #     cursor.execute(sql13)
        #     result13 = cursor.fetchone()

        #     if result13:
        #         TradeQuanti = int(it[18]) + int(result13[18])
        #         NetWeight = int(it[20]) + int(result13[20])
        #         TradeValue = int(it[22]) + int(result13[22])
        #         sql14 = "UPDATE %s" % tableName + " SET TradeQuantity = %s" % TradeQuanti + ",NetWeight = %s" % NetWeight + ",TradeValue = %s" % TradeValue + " WHERE id = %s" % result13[0]+" and cmdCode=%d"%hsCode
        #         sql15 = "delete from %s" % tableName + " where id = %s" % it[0]+" and cmdCode=%d"%hsCode
        #         cursor.execute(sql14)
        #         db.commit()
        #         cursor.execute(sql15)
        #         db.commit()

        # USA re-export: rtCode=842
        sql16 = "select * from %s" % tableName + " where rtCode = 842 and rgCode = 3 and cmdCode=%d"%hsCode + " and period=%s"%str(year)
        cursor.execute(sql16)
        result16 = cursor.fetchall()

        for it in result16:
            sql17 = "select * from %s" % tableName + " where rtCode = 842 and rgCode = 2 and ptCode = %s" % it[11]+" and cmdCode=%d"%hsCode + " and period=%s"%str(year)
            cursor.execute(sql17)
            result17 = cursor.fetchone()

            if result17:
                TradeQuanti = int(it[18]) + int(result17[18])
                NetWeight = int(it[20]) + int(result17[20])
                TradeValue = int(it[22]) + int(result17[22])
                sql18 = "UPDATE %s" % tableName + " SET TradeQuantity = %s" % TradeQuanti + ",NetWeight = %s" % NetWeight + ",TradeValue = %s" % TradeValue + " WHERE id = %s" % \
                        result17[0]
                sql19 = "delete from %s" % tableName + " where id = %s" % it[0] 
                cursor.execute(sql18)
                db.commit()
                cursor.execute(sql19)
                db.commit()

        # USA re-import: rtCode=842
        # sql20 = "select * from %s" % tableName + " where rtCode = 842 and rgCode = 4 and cmdCode=%d"%hsCode
        # cursor.execute(sql20)
        # result20 = cursor.fetchall()

        # for it in result20:
        #     sql21 = "select * from %s" % tableName + " where rtCode = 842 and rgCode = 1 and ptCode = %s" % it[11]+" and cmdCode=%d"%hsCode
        #     cursor.execute(sql21)
        #     result21 = cursor.fetchone()

        #     if result21:
        #         TradeQuanti = int(it[18]) + int(result21[18])
        #         NetWeight = int(it[20]) + int(result21[20])
        #         TradeValue = int(it[22]) + int(result21[22])
        #         sql22 = "UPDATE %s" % tableName + " SET TradeQuantity = %s" % TradeQuanti + ",NetWeight = %s" % NetWeight + ",TradeValue = %s" % TradeValue + " WHERE id = %s" % \
        #                 result21[0]+" and cmdCode=%d"%hsCode
        #         sql23 = "delete from %s" % tableName + " where id = %s" % it[0] +" and cmdCode=%d"%hsCode
        #         cursor.execute(sql22)
        #         db.commit()
        #         cursor.execute(sql23)
        #         db.commit()

        # sql2 = "UPDATE %s" % tableName + " SET rgCode = 2,rgDesc = 'Export' WHERE rtCode = 344 and rgCode = 3"
        # sql3 = "UPDATE %s" % tableName + " SET rgCode = 2,rgDesc = 'Export' WHERE rtCode = 784 and rgCode = 3"
        # sql4 = "UPDATE %s" % tableName + " SET rgCode = 1,rgDesc = 'Import' WHERE rtCode = 344 and rgCode = 4"
        # sql5 = "UPDATE %s" % tableName + " SET rgCode = 1,rgDesc = 'Import' WHERE rtCode = 784 and rgCode = 4"
        
        # cursor.execute(sql2)
        # cursor.execute(sql3)
        # cursor.execute(sql4)
        # cursor.execute(sql5)

        # #ARE re-export: rtCode=784
        # sql24="select * from %s"%tableName +" where rtCode=784 and rgCode=3 and cmdCode=%d"%hsCode
        # cursor.execute(sql24) 
        # result22=cursor.fetchall()
        # for it in result22:
        #     sql25="select * from %s"%tableName +" where rtCode=784 and rgCode=2 and ptCode=%s"%it[11]+" and cmdCode=%d"%hsCode
        #     cursor.execute(sql25)
        #     result23=cursor.fetchone()
        #     if result23:
        #         TradeQuanti = int(it[18]) + int(result23[18])
        #         NetWeight = int(it[20]) + int(result23[20])
        #         TradeValue = int(it[22]) + int(result23[22])
        #         sql26 = "UPDATE %s" % tableName + " SET TradeQuantity = %s" % TradeQuanti + ",NetWeight = %s" % NetWeight + ",TradeValue = %s" % TradeValue + " WHERE id = %s" % \
        #                 result23[0] +" and cmdCode=%d"%hsCode
        #         sql27 = "delete from %s" % tableName + " where id = %s" % it[0] +" and cmdCode=%d"%hsCode
        #         cursor.execute(sql26)
        #         db.commit()
        #         cursor.execute(sql27)
        #         db.commit()


        #ARE re-import: rtCode=784
        # sql28="select * from %s"%tableName +" where rtCode=784 and rgCode=4 and cmdCode=%d"%hsCode
        # cursor.execute(sql28) 
        # result24=cursor.fetchall()
        # for it in result24:
        #     sql29="select * from %s"%tableName +" where rtCode=784 and rgCode=1 and ptCode=%s"%it[11]+" and cmdCode=%d"%hsCode
        #     cursor.execute(sql29)
        #     result25=cursor.fetchone()
        #     if result25:
        #         TradeQuanti = int(it[18]) + int(result25[18])
        #         NetWeight = int(it[20]) + int(result25[20])
        #         TradeValue = int(it[22]) + int(result25[22])
        #         sql30 = "UPDATE %s" % tableName + " SET TradeQuantity = %s" % TradeQuanti + ",NetWeight = %s" % NetWeight + ",TradeValue = %s" % TradeValue + " WHERE id = %s" % \
        #                 result25[0] +" and cmdCode=%d"%hsCode
        #         sql31 = "delete from %s" % tableName + " where id = %s" % it[0] +" and cmdCode=%d"%hsCode
        #         cursor.execute(sql30)
        #         db.commit()
        #         cursor.execute(sql31)
        #         db.commit()


        # #CAN re-export: rtCode=124
        # sql24="select * from %s"%tableName +" where rtCode=124 and rgCode=3 and cmdCode=%d"%hsCode
        # cursor.execute(sql24) 
        # result22=cursor.fetchall()
        # for it in result22:
        #     sql25="select * from %s"%tableName +" where rtCode=124 and rgCode=2 and ptCode=%s"%it[11]+" and cmdCode=%d"%hsCode
        #     cursor.execute(sql25)
        #     result23=cursor.fetchone()
        #     if result23:
        #         TradeQuanti = int(it[18]) + int(result23[18])
        #         NetWeight = int(it[20]) + int(result23[20])
        #         TradeValue = int(it[22]) + int(result23[22])
        #         sql26 = "UPDATE %s" % tableName + " SET TradeQuantity = %s" % TradeQuanti + ",NetWeight = %s" % NetWeight + ",TradeValue = %s" % TradeValue + " WHERE id = %s" % \
        #                 result23[0] +" and cmdCode=%d"%hsCode
        #         sql27 = "delete from %s" % tableName + " where id = %s" % it[0] +" and cmdCode=%d"%hsCode
        #         cursor.execute(sql26)
        #         db.commit()
        #         cursor.execute(sql27)
        #         db.commit()

        
        # CHN re-export: rtCode=156
        sql28 = "select * from %s" % tableName + " where rtCode = 156 and rgCode = 3 and cmdCode=%d"%hsCode + " and period=%s"%str(year)
        cursor.execute(sql28)
        result26 = cursor.fetchall()

        for it in result26:
            sql29 = "select * from %s" % tableName + " where rtCode = 156 and rgCode = 2 and ptCode = %s" % it[11]+" and cmdCode=%d"%hsCode
            cursor.execute(sql29)
            result27 = cursor.fetchone()

            if result27:
                TradeQuanti = int(it[18]) + int(result17[18])
                NetWeight = int(it[20]) + int(result17[20])
                TradeValue = int(it[22]) + int(result17[22])
                sql30 = "UPDATE %s" % tableName + " SET TradeQuantity = %s" % TradeQuanti + ",NetWeight = %s" % NetWeight + ",TradeValue = %s" % TradeValue + " WHERE id = %s" % \
                        result27[0]
                sql31 = "delete from %s" % tableName + " where id = %s" % it[0]
                cursor.execute(sql30)
                db.commit()
                cursor.execute(sql31)
                db.commit()




        #delete others re-import and re-export
        sql6 = "delete from %s" % tableName + " where rgCode = 3 and cmdCode=%d"%hsCode
        sql7 = "delete from %s" % tableName + " where rgCode = 4 and cmdCode=%d"%hsCode

        cursor.execute(sql6)
        db.commit()
        cursor.execute(sql7)
        db.commit()
        print("%s   done"%str(year))
        year+=1

print("OK")
