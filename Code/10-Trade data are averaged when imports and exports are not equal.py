import pymssql
import xlrd


db = pymssql.connect(".", "sa", "123456", "plastic data")
cursor = db.cursor()

hsCodes=[392321,392329]
excelData1 = xlrd.open_workbook(r'~:/Plastic/Comtrade Country Code and ISO list.xlsx')
sheet1 = excelData1.sheet_by_index(0)#selecet sheet1
usefulDataCodes = sheet1.col_values(0)#select first column

for hsCode in hsCodes:
    rowNumber = 0
    print('begin delete the data with code %d'% hsCode)
    for usefulDataCode in usefulDataCodes:
        rowNumber = rowNumber + 1
        print(rowNumber)
        usefulDataCode = str(int(usefulDataCode))
        year=1990
        while year <= 2019:
            tableName = 'edata' + str(year)
            print(" begin  " + str(year))
            sql3 = "select * from %s" % tableName + " where rtCode = '%s'" % usefulDataCode +" and cmdCode = '%d'" % hsCode + " and period=%s"%str(year)
            cursor.execute(sql3)
            results = cursor.fetchall()
            # Walk through every piece of data
            for result in results:
                if result[7] == "Import":
                    sellingCode = result[11]#ptCode
                    sql4 = "select * from %s" % tableName + " where rtCode = '%s'" % sellingCode + " and ptCode = '%s'" % usefulDataCode + " and rgDesc = 'Export'" +" and cmdCode=%s"%hsCode + " and period=%s"%str(year)#select correspond export data
                    cursor.execute(sql4)
                    sellingCodeResult = cursor.fetchone()
                    if sellingCodeResult:
                        if int(result[20]) == int(sellingCodeResult[20]):# Trade imports and exports are equal, just delete either one
                            deleteId0 = sellingCodeResult[0]
                            sql5 = "delete from %s" % tableName + " where id = '%s'" % deleteId0
                            cursor.execute(sql5)
                            db.commit()
                        else:# Trade import and export are not equal, delete one of them, and take the average value of the other trade value
                            ANetWeight=(int(result[20])+int(sellingCodeResult[20]))/2
                            ANetWeight=int(ANetWeight)
                            ATradeValue=(int(result[22])+int(sellingCodeResult[22]))/2
                            ATradeValue=int(ATradeValue)
                            deleteId1 = sellingCodeResult[0]
                            sql8 = "delete from %s"%tableName +" where id = '%s'"%deleteId1
                            cursor.execute(sql8)
                            db.commit()
                            sql9 = "update %s"%tableName +" set NetWeight=%d "% ANetWeight +", TradeValue=%d"%ATradeValue+" where id=%s"%result[0]
                            cursor.execute(sql9)
                            db.commit() 
                        
                if result[7] == "Export":
                    purchaseCode = result[11]#ptCode
                    sql6 = "select * from %s" % tableName + " where rtCode = '%s'" % purchaseCode + " and ptCode = '%s'" % usefulDataCode + " and rgDesc = 'Import'"+" and cmdCode=%d"%hsCode + " and period=%s"%str(year)
                    cursor.execute(sql6)
                    purchaseCodeResult = cursor.fetchone()
                    if purchaseCodeResult:
                        if int(result[20]) == int(purchaseCodeResult[20]):
                            deleteId2 = purchaseCodeResult[0]
                            sql7 = "delete from %s" % tableName + " where id = '%s'" % deleteId2
                            cursor.execute(sql7)
                            db.commit()
                        else:
                            ANetWeight1=(int(result[20])+int(purchaseCodeResult[20]))/2
                            ANetWeight1=int(ANetWeight1)
                            ATradeValue1=(int(result[22])+int(purchaseCodeResult[22]))/2
                            ATradeValue1=int(ATradeValue1)
                            deleteId3 = purchaseCodeResult[0]
                            sql10="delete from %s"%tableName +" where id='%s'"%deleteId3 
                            cursor.execute(sql10)
                            db.commit()
                            sql11="update %s"%tableName +" set NetWeight=%d"%ANetWeight1+", TradeValue=%d"%ATradeValue1 + " where id=%s"%result[0] 
                            cursor.execute(sql11)
                            db.commit()
            year+=1


                        
                        
