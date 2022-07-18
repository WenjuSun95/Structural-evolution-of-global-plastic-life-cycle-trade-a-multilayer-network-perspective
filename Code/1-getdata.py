import urllib.request  #Make a request, request the API
import json    #data format
import pymssql #Connect to the SQL Server database
import xlrd
import time
from urllib.error import HTTPError

excelData = xlrd.open_workbook(r'~/Plastic/Comtrade Country Code and ISO list.xlsx')

sheet = excelData.sheet_by_index(0)    # sheet index starts at 0

rtCodeList = sheet.col_values(0)      # Get the contents of the first column

year=1990
j=0
while year<=2019:
    
    n = input("Enter the number of lines to start with")

    i= int(n)
    print('Start the download'+str(year))
    tablename='edata1999'
    
    for rtCode in rtCodeList:

        j = j + 1
        
        if j >= i:

            code = str(int(rtCode))
            token="/m8NMFhdlw76eFXmJ4fBKvYUs4BzwOmdmExkN+TC1tSjYZ+gZxRUjyiMZGYzp2wMulkQOaCU3xoyn+V1FVKP8hRN2M7z+0j2OpWILX1AB0O188Scfu0IYtY/4hgagLfg=="
            url = "http://comtrade.un.org/api/get?max=50000&type=C&freq=M&px=HS&ps=%s&r="%str(year) +code+"&p=all&rg=all&cc=392321,392329&fmt=json&token=%s"%token
           
            req = urllib.request.Request(url)  #request url
            

            resp = urllib.request.urlopen(req)  #open url


            content = resp.read().decode('utf-8') #read data
            res = json.loads(content)   #Convert the read data to json
            db = pymssql.connect(".", "sa", "123456", "plastic data")  # connect the local database
            cursor = db.cursor()  # write database     cursors
            if res.get('dataset'):

                for result in res.get('dataset'):
                    pfCode = result.get('pfCode')
                    yr = result.get('yr')
                    period = result.get('period')
                    periodDesc = result.get('periodDesc')
                    aggrLevel = result.get('aggrLevel')
                    rgCode = result.get('rgCode')
                    rgDesc = result.get('rgDesc')
                    rtCode = result.get('rtCode')
                    rtTitle = result.get('rtTitle')
                    rt3ISO = result.get('rt3ISO')
                    ptCode = result.get('ptCode')
                    ptTitle = result.get('ptTitle')
                    pt3ISO = result.get('pt3ISO')
                    cmdCode = result.get('cmdCode')
                    cmdDesc = result.get('cmdDescE')
                    qtCode = result.get('qtCode')
                    qtDesc = result.get('qtDesc')
                    TradeQuantity = result.get('TradeQuantity')
                    AltQuantity = result.get('AltQuantity')
                    NetWeight = result.get('NetWeight')
                    GrossWeight = result.get('GrossWeight')
                    TradeValue = result.get('TradeValue')

                    sql = "INSERT INTO %s(pfCode, yr, period, periodDesc, aggrLevel,  rgCode, rgDesc, rtCode, rtTitle, rt3ISO, ptCode, "%tablename+\
                        "PtTitle, pt3ISO,  cmdCode, cmdDesc, qtCode, qtDesc, " \
                        " TradeQuantity, AltQuantity, NetWeight, GrossWeight, TradeValue) " \
                        "VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"


                    # use execute() method executes SQL statements
                    cursor.execute(sql,
                            (pfCode, yr, period, periodDesc, aggrLevel,  rgCode, rgDesc, rtCode, rtTitle, rt3ISO,
                                ptCode, ptTitle, pt3ISO, cmdCode, cmdDesc, qtCode, qtDesc,  TradeQuantity, AltQuantity,NetWeight, GrossWeight, TradeValue))

                    db.commit()  # commit data

            # close cursor
            cursor.close()
            # close database
            db.close()
        
        m = str(j)
        print("Line"+m+"done")
    print(str(year)+'done')
    year +=1
    j=0
print("\n【download succeed】")
