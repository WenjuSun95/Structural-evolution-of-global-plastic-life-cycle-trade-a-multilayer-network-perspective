import pymssql
import xlrd
db = pymssql.connect(".", "sa", "123456", "plastic  data")
cursor = db.cursor()
# hsCodes=[391610,391722,391731,391732,392321,392329,392410,392620,392690]
hsCodes=[392321,392329]

for hsCode in hsCodes:
    print('begin to merge trade data with code %d'% hsCode)
    year=1990
    while year <= 2019:
        
        tableName = 'edata' + str(year)
        print(" begin  " + tableName)
        TradeFlowlists=[]

        sql3 = "select * from %s" % tableName +" where cmdCode = '%d'" % hsCode +" and period=%s"%str(year)
        cursor.execute(sql3)
        flowDatas = cursor.fetchall()
        for flowData in flowDatas:
            list1=[]
            list1.append(str(flowData[8]))#rtCode
            list1.append(str(flowData[11]))#ptCode
            if list1 not in TradeFlowlists:
                TradeFlowlists.append(list1)
        for TradeFlowlist in TradeFlowlists:
            ########## merge import trade data ##################
            sql0 = "select * from %s" % tableName + " where rtCode = '%s'" % TradeFlowlist[0] +" and ptCode = '%s'" % TradeFlowlist[1]+" and cmdCode = '%d'" % hsCode+" and rgCode=1 and period=%s"%str(year)#import data
            cursor.execute(sql0)
            result1 = cursor.fetchall()
            if len(result1)>1:

                TradeQuantity_I=0
                NetWeight_I=0
                TradeValue_I=0
                
                deleteIDlist_I=[]
                for I in result1:
                    
                    NetWeight_I +=int(I[20])
                    TradeValue_I+=int(I[22])
                    deleteIDlist_I.append(str(I[0]))
                sql1 = "update %s"%tableName +" set NetWeight=%d "% NetWeight_I +", TradeValue=%d"%TradeValue_I+" where id=%s"%deleteIDlist_I[0]
                cursor.execute(sql1)
                db.commit()
                del deleteIDlist_I[0]
                for deleteID_I in deleteIDlist_I:
                    sql2="delete from %s"%tableName +" where id = %s"%str(deleteID_I)
                    cursor.execute(sql2)
                    db.commit()


            ################## merge export trade data ##########################3
            sql4 = "select * from %s" % tableName + " where rtCode = '%s'" % TradeFlowlist[0] +" and ptCode = '%s'" % TradeFlowlist[1]+" and cmdCode = '%d'" % hsCode+" and rgCode=2 and period=%s"%str(year)#export data
            cursor.execute(sql4)
            result2 = cursor.fetchall()
            if len(result2)>1:
                TradeQuantity_E=0
                NetWeight_E=0
                TradeValue_E=0
                
                deleteIDlist_E=[]
                for E in result2:
                    
                    NetWeight_E+=int(E[20])
                    TradeValue_E+=int(E[22])
                    deleteIDlist_E.append(str(E[0]))
                sql5 = "update %s"%tableName +" set NetWeight=%d "% NetWeight_E +", TradeValue=%d"%TradeValue_E+" where id=%s"%deleteIDlist_E[0]
                cursor.execute(sql5)
                db.commit()
                del deleteIDlist_E[0]
                for deleteID_E in deleteIDlist_E:
                    sql6="delete from %s"%tableName +" where id = %s"%str(deleteID_E)
                    cursor.execute(sql6)
                    db.commit()
        print(str(year) +"merge success")
        year+=1
     
print("ok")       