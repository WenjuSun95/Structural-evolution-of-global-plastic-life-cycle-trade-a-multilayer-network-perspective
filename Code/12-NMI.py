import numpy as np
import math
import csv
import pandas as pd
from sklearn import metrics


def NMI(A,B):
    # len(A) should be equal to len(B)
    total = len(A)
    A_ids = set(A)
    B_ids = set(B)
    #Mutual information

    MI = 0
    eps = 1.4e-45
    for idA in A_ids:
        for idB in B_ids:
            idAOccur = np.where(A==idA)
            idBOccur = np.where(B==idB)
            idABOccur = np.intersect1d(idAOccur,idBOccur)
            px = 1.0*len(idAOccur[0])/total
            py = 1.0*len(idBOccur[0])/total
            pxy = 1.0*len(idABOccur)/total
            MI = MI + pxy*math.log(pxy/(px*py)+eps,2)
    # Normalized Mutual information
    Hx = 0
    for idA in A_ids:
        idAOccurCount = 1.0*len(np.where(A==idA)[0])
        Hx = Hx - (idAOccurCount/total)*math.log(idAOccurCount/total+eps,2)
    Hy = 0
    for idB in B_ids:
        idBOccurCount = 1.0*len(np.where(B==idB)[0])
        Hy = Hy - (idBOccurCount/total)*math.log(idBOccurCount/total+eps,2)
    MIhat = 2.0*MI/(Hx+Hy)
    return MIhat


if __name__ == '__main__':

    year = 1990
    data = []
    while year < 2019:
        
        pathA = "~:/Plastic/合并数据/合并数据-社区划分/" + str(year)+"-"+str(year+1) + ".csv"
        with open(pathA, "r", encoding="utf-8") as csvfile:
            read = csv.reader(csvfile)
            A = []
            B = []
            for i in read:
                A.append(int(i[2]))
                B.append(int(i[3]))

        # pathB = "E:/Plastic/production-30年国家与度的数据/" + str(year+1) + ".csv"
        # with open(pathB, "r", encoding="utf-8") as csvfile:
        #     read = csv.reader(csvfile)
        #     B = []
        #     for i in read:
        #         B.append(int(i[8]))

        A = np.array(A)
        B = np.array(B)
        # A=np.array([1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3])
        # B=np.array([1,2,1,1,1,1,1,2,2,2,2,3,1,1,3,3,3])
        NMIAB = NMI(A, B)
        print(str(year))
        print(metrics.normalized_mutual_info_score(A,B))
        
        print(NMIAB)
        yearAB = str(year) + "-" + str(year+1)
        # yearAB=str(1988)+"-"+str(1989)
        row = []
        row.append(yearAB)
        row.append(NMIAB)
        data.append(row)
        year = year + 1
    data = pd.DataFrame(data)
    data.to_csv("~:/Plastic/合并数据/30年之间的NMI.csv")
        