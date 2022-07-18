# -*- coding: utf-8 -*-


import pymssql
import xlrd


db = pymssql.connect(".", "sa", "123456", "plastic data")
cursor = db.cursor()

excelData = xlrd.open_workbook(r'~:/Plastic/shandiaode.xlsx')
sheet = excelData.sheet_by_index(0)#choose sheet1
rtCodeList = sheet.col_values(0)#choose first colume

rowNumber = 0

# delete table data
for rtCode in rtCodeList:
    rowNumber = rowNumber + 1
    print(rowNumber)

    code = str(int(rtCode))
    
    year=1990
    while year <= 2019:
        tableName = 'edata' + str(year) 
        
        print(" begin "+str(year))

        sql1 = "delete from %s" % tableName + " where rtCode = '%s'" % code
        sql2 = "delete from %s" % tableName + " where ptCode = '%s'" % code

        cursor.execute(sql1)
        db.commit()
        cursor.execute(sql2)
        db.commit()
        print(str(year)+'success')
        year+=1
print('done')