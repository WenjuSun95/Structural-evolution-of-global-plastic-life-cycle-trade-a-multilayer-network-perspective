import pymssql

datasets=['Production','Manufacturing','Consumption','Waste management']
datasets=['plastic bag-month data']
for dataset in datasets:
    db = pymssql.connect(".", "sa", "123456", "%s" % dataset)
    cursor = db.cursor()
    i=1990
    while i<=2019:
        tablename='edata'+str(i)
        sql="create table  %s"%tablename +\
            "("+"id int identity(1,1) primary key,pfCode nvarchar(255),yr nvarchar(255),period nvarchar(255),periodDesc nvarchar(255),aggrLevel nvarchar(255),rgCode nvarchar(255),"\
                "rgDesc nvarchar(255),rtCode nvarchar(255),rtTitle nvarchar(255),rt3ISO nvarchar(255),ptCode nvarchar(255),PtTitle nvarchar(255),"\
                "pt3ISO nvarchar(255),cmdCode nvarchar(255),cmdDesc nvarchar(255),qtCode nvarchar(255),qtDesc nvarchar(255),TradeQuantity nvarchar(255),"\
                "AltQuantity nvarchar(255),NetWeight bigint,GrossWeight nvarchar(255),TradeValue bigint"+ ");"
        cursor.execute(sql)
        db.commit()
        print(tablename + 'creat succeed')
        i+=1
    cursor.close()
    db.close()
    print(dataset+"done")

     