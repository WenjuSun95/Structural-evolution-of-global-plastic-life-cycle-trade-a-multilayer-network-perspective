import pymssql
import pandas as pd
import xlrd

db = pymssql.connect(".", "sa", "123456", "plastic data")
cursor = db.cursor()
year=1990
while year <= 2019:
    tableName = 'edata' + str(year)
    print("begin %s"%str(year))
    N = 0
    datas = []
    sql1 = "select * from %s" % tableName + " where rgCode = 2 and period=%s"%str(year)#export
    cursor.execute(sql1)
    result1 = cursor.fetchall()
    if result1:
        for result2 in result1:
            N +=1
            weight=0
            source=""
            target=""
            source = result2[10]
            target = result2[13]
            weight += int(result2[20])

            data = []
            data.append(source)
            data.append(target)
            data.append("directed")
            data.append(N)
            data.append(weight)
            datas.append(data)

    sql2 = "select * from %s" % tableName + " where rgCode = 1 and period=%s"%str(year)#import
    cursor.execute(sql2)
    result3 = cursor.fetchall()
    if result3:
        for result4 in result3:
            N +=1
            weight=0
            source=""
            target=""
            source = result4[13]
            target = result4[10]
            weight +=int(result4[20])

            data = []
            data.append(source)
            data.append(target)
            data.append("directed")
            data.append(N)
            data.append(weight)
            datas.append(data)
    
    resultData = pd.DataFrame(datas)
    resultData.to_csv('~:/Plastic/single-use plastics/The impact of EU plastic policy/导出数据/' + str(year) + '.csv',header=False,index=False)

    print("%s done"%str(year))
    year+=1
print('OK')
