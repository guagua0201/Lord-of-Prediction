# -*- coding: utf-8 -*-
"""
Created on Mon Dec 24 04:57:48 2018

@author: yu-pu
"""

import requests
#fake_useragent
from bs4 import BeautifulSoup

#ua = fake_useragent.UserAgent()

headers={
    #'User-Agent':ua.random
}

url = 'http://23.252.161.89:8666/pk10/kaijiang'
response = requests.get(url,headers=headers)

bs = BeautifulSoup(response.text, 'html.parser')



#header = ['期数','日期','第一名','第二名','第三名','第四名','第五名','第六名','第七名','第八名','第九名','第十名']


output = open("../documents/beiJingCart.txt","w",encoding='utf-8')
output.close()
output = open("../documents/BeiJingCart.txt","a",encoding='utf-8')

n = 1

for tr in bs.find('table', id='history').find('tbody').find_all('tr'):

    period = tr.find_all('td')[0].find_all('i')[0].text
    date = tr.find_all('td')[0].find_all('i')[1].text
    #sheet.write(n, 0, peroid)
    #sheet.write(n, 1, date)
    output.write(period + '\n')
    output.write(date + '\n')
    output.write('\n')

    for k in range(10):
        #sheet.write(n, k+2, tr.find_all('span')[k].text)
        output.write(tr.find_all('span')[k].text + ' ')
        #print(tr.find_all('span')[k].text,end = ' ')
    output.write('\n')

    n = n + 1

output.close();
