import pymssql

db=pymssql.connect(".","sa","123456","plastic data")
cursor=db.cursor()

hsCodes=[392321,392329]
year=1990
while year<=2019:#loop through each table
    
    tablename='edata'+str(year)
    print('begin populate %s missing data'%tablename)
    for hsCode in hsCodes:#loop through each trade code in each table
        sql1="select * from %s" % tablename + " where cmdCode=%s " % (str(hsCode))+" and period=%s" % str(year)
        cursor.execute(sql1)
        rowdatas=cursor.fetchall()
        averge=0
        totalNetWeight=0
        totalTradeValue=0
        if rowdatas:
            for rowdata in rowdatas:#loop each data
                if int(rowdata[20]) !=0 and int(rowdata[22]) !=0 :#find data where neither NetWeight nor TradeValue is zero and use it to calculate the average price
                    totalNetWeight +=int(rowdata[20])
                    totalTradeValue +=int(rowdata[22])
                if int(rowdata[20])==0 and int(rowdata[22]) ==0:
                    sql2="delete from %s"%tablename +" where id=%d"%int(rowdata[0])
                    cursor.execute(sql2)
                    db.commit()
            if totalNetWeight == 0:
                continue
            averge=totalTradeValue/totalNetWeight
    
            for row in rowdatas:
                if int(row[20]) ==0 and int(row[22])!=0:
                    netweight=int(row[22])/averge
                    netweight=int(netweight)
                    sql3="UPDATE %s"%tablename +" SET NetWeight =%d"%netweight +" WHERE id = %s"%row[0]
                    cursor.execute(sql3)
                    db.commit()
                if int(row[20]) !=0 and int(row[22]) == 0:
                    tradevalue=int(row[20]) * int(averge)
                    tradevalue=int(tradevalue)
                    sql4="UPDATE %s"%tablename +" SET TradeValue=%d"%tradevalue +" WHERE id = %s"%row[0]
                    cursor.execute(sql4)
                    db.commit()
    sql5="delete from %s"%tablename +" where period=%s"%str(year) + " and NetWeight=0 or TradeValue=0"
    cursor.execute(sql5)
    db.commit()
    print('%s populate success'%str(year))
    year+=1
print("populate done")



    




