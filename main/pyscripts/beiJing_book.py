# -*- coding: utf-8 -*-
"""
Created on Mon Dec 24 04:57:48 2018

@author: yu-pu
"""

import xlwt
import requests,fake_useragent
from bs4 import BeautifulSoup

ua = fake_useragent.UserAgent()

headers={
    'User-Agent':ua.random
}

url = 'http://23.252.161.89:8666/pk10/kaijiang'
response = requests.get(url,headers=headers)

bs = BeautifulSoup(response.text, 'html.parser')

book = xlwt.Workbook(encoding='utf-8',style_compression=0)

sheet = book.add_sheet('sheet1',cell_overwrite_ok=True)

header = ['期数','日期','第一名','第二名','第三名','第四名','第五名','第六名','第七名','第八名','第九名','第十名']

for i in range(len(header)):
    sheet.write(0, i, header[i])

n = 1

for tr in bs.find('table', id='history').find('tbody').find_all('tr'):
    peroid = tr.find_all('td')[0].find('i').text
    date = tr.find_all('td')[0].find_all('i')[1].text
    sheet.write(n, 0, peroid)
    sheet.write(n, 1, date)

    for k in range(10):
        sheet.write(n, k+2, tr.find_all('span')[k].text)

    n = n + 1

book.save('./beiJingCart.xls')
