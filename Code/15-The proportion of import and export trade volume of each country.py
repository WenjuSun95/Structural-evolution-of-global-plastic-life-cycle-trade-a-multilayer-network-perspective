import xlrd
import csv
import pandas as pd
i=1990

while i<=2019:
    ratiodatas=[]
    print("begin %s"%i)

    datas0=csv.reader(open('~:/Plastic/Waste management/Waste management-30年国家与度的数据/%s.csv'%i), delimiter=',')
    countdegree=0
    ratioweight=0
    for data in datas0:
        countdegree += int(data[5])
        # print(countnode,countdegree)
    datas1=csv.reader(open('~:/Plastic/Waste management/Waste management-30年国家与度的数据/%s.csv'%i), delimiter=',')
    for x in datas1:
        ratiodata=[]
        ratioweight  =float(int(x[5])/countdegree)
        ratiodata.append(x[0])
        ratiodata.append(ratioweight)
        ratiodatas.append(ratiodata)
        # print(x[0],ratioweight)
        
    print("%s done"%i)
    
    resultdata = pd.DataFrame(ratiodatas)
    resultdata.to_csv('~:/Plastic/Waste management/进口国家比例/'+str(i)+'.csv')
    i+=1
