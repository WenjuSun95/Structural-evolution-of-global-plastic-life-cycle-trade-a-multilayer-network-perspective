#!/usr/bin/env python
# -*-coding:utf-8 -*-

import matplotlib.pyplot as plt
import numpy as np
from sklearn import linear_model
from scipy.stats import norm
import xlrd
import csv

def DataGenerate():
    csvData = csv.reader(open('~:/Plastic/合并数据/合并数据-30年国家与度的数据/2018.csv'),delimiter=',')
    # sheet = excelData.sheet_by_index(0)   
    # Xdata = sheet.col_values(0)     
    # Ydata = sheet.col_values(1)  
    X=[]
    Y=[]
    for i in csvData:
        # print(int(i[4]))
        X.append(int(i[4]))
    csvData1 = csv.reader(open('~:/Plastic/合并数据/合并数据-30年国家与度的数据/2018.csv'),delimiter=',')
    for j in csvData1:
        # print(float(j[12])
        Y.append(float(j[10]))

    return X,Y


def DataFitAndVisualization(X,Y):
    # prepare data
    X_parameter=[]
    Y_parameter=[]
    for single_square_feet ,single_price_value in zip(X,Y):
        X_parameter.append([float(single_square_feet)])
        Y_parameter.append(float(single_price_value))
    
    # model fit
    regr = linear_model.LinearRegression()
    regr.fit(X_parameter, Y_parameter)
    # model result
    print('Coefficients: \n', regr.coef_,)
    print("Intercept:\n",regr.intercept_)
    print('R^2:\n',regr.score(X_parameter,Y_parameter))
    # The mean square error
    # print("Residual sum of squares: %.8f"
    #   % np.mean((regr.predict(X_parameter) - Y_parameter) ** 2))  

    # plot
    # plt.title("")
    # plt.scatter(X_parameter, Y_parameter,  color='black')
    # plt.plot(X_parameter, regr.predict(X_parameter), color='blue',linewidth=3)

    # # plt.xticks(())
    # # plt.yticks(())
    # plt.show()

if __name__=="__main__":
    X,Y=DataGenerate()
    DataFitAndVisualization(X,Y)
