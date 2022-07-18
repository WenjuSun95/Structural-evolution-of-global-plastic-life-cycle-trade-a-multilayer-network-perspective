import xlrd
import csv
import pandas as pd

datas0=csv.reader(open('~:/Plastic/合并数据/合并数据-30年国家与度的数据/1990.csv'), delimiter=',')
countnode=0
countdegree=0
rationode=0
ratiodegree=0

ratiodatas=[]
for data in datas0:
    countnode +=1
    countdegree += int(data[7])
    print(countnode,countdegree)
datas1=csv.reader(open('~:/Plastic/合并数据/合并数据-30年国家与度的数据/1990.csv'), delimiter=',')
for x in datas1:
    ratiodata=[]
    rationode += float(1/countnode)
    ratiodegree +=float(int(x[7])/countdegree)
    print(rationode,ratiodegree)
    ratiodata.append(rationode)
    ratiodata.append(ratiodegree)
    ratiodatas.append(ratiodata)
resultdata = pd.DataFrame(ratiodatas)
resultdata.to_csv('~:/Plastic/合并数据/合并数据-国家与权重比率统计/1990.csv')



