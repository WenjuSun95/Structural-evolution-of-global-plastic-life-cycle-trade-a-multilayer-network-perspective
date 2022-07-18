import xlrd
import csv
import pandas as pd
i=1990

ratiodatas=[]
while i<=2019:
    print("begin %s"%i)
    datas0=csv.reader(open('~:/Plastic/single-use plastics/plastic bag/欧盟在塑料袋贸易中的排名/30年进口贸易量排名由高到低的国家和度的数据/%s.csv'%i), delimiter=',')
    t=0
    ratiodata=[]
    countnode=0
    Totalin=0
    Totalout=0
    Total=0
    rationode=0
    ratiodegree=0
    for data in datas0:
        countnode +=1
        Totalin += int(data[5])
        Totalout += int(data[6])
        Total += int(data[7])
        # print(countnode,countdegree)
    ratiodata.append(i)
    ratiodata.append(Totalin)
    ratiodata.append(Totalout)
    ratiodata.append(Total)
    ratiodatas.append(ratiodata)
    # datas1=csv.reader(open('~:/Plastic/single-use plastics/plastic bag/欧盟在塑料袋贸易中的排名/30年进口贸易量排名由高到低的国家和度的数据/%s.csv'%i), delimiter=',')
    # for x in datas1:
    #     t+=1
    #     ratiodata=[]
    #     rationode += float(1/countnode)
    #     ratiodegree +=float(int(x[5])/countdegree)
    #     ratiodata.append(x[0])
    #     ratiodata.append(x[5])
    #     ratiodatas.append(ratiodata)
    #     if ratiodegree >=0.8:
    #         print(rationode,ratiodegree,t)
    #         # ratiodata.append(rationode)
    #         # ratiodata.append(ratiodegree)
    #         # ratiodata.append(t)
    #         # ratiodatas.append(ratiodata)
    #         break 
    # ratiodata1=[]
    # ratiodata1.append('Total')
    # ratiodata1.append(countdegree)
    # ratiodatas.append(ratiodata1)
    # # print(ratiodata)
    # # print(ratiodatas)

    print("%s done"%i)
    i+=1
resultdata = pd.DataFrame(ratiodatas)
# resultdata.to_csv('~:/Plastic/single-use plastics/plastic bag/欧盟在塑料袋贸易中的排名/%s.csv'%i)
resultdata.to_csv('~:/Plastic/single-use plastics/plastic bag/欧盟在塑料袋贸易中的排名/Total.csv')


