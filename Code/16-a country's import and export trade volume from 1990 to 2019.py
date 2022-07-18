import csv
from typing import List
import pandas as pd


# ISO3=['ISL','DNK','KOR','THA','PAK','NZL','MNG','BRA','CHL','PAN']
ISO3=['USA','MEX']
for I in ISO3:

    List=[]
    
    year=1990
    
    while year<=2019:
        list1=[]
        
        with open("~:/Plastic/Consumption/Consumption-30年国家与度的数据/" + str(year) + ".csv","r",encoding="utf-8") as csvfile:
            reads = csv.reader(csvfile)
            reads=list(reads)
            for k in reads:
                if k[0]==I:
                    
                    list1.append(year)
                    list1.append(k[5])
                    list1.append(k[6])
                    List.append(list1)
        print(str(year)+'.csv'+'done')
        year +=1
    resultData = pd.DataFrame(List)
    resultData.to_csv('~:/Plastic/Consumption/1990-2019年进出口贸易量（每个国家）/'+'%s.csv'%I,index=False,header=False)