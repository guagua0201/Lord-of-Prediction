# -*- coding: utf-8 -*-
"""
Created on Mon Jan  7 20:05:28 2019

@author: yu-pu
"""



import urllib
import urllib.request
response = urllib.request.urlopen("http://caipiao.163.com/award/cqssc/20190107.html")
html_doc = response.read()

from bs4 import BeautifulSoup
soup = BeautifulSoup(html_doc, 'html.parser')
#print(soup)
soupBoard = soup.find_all("td")
#print(soupBoard)

output = open('./shishicai.txt',"w",encoding = 'utf-8')
output.close();
output = open('./shishicai.txt',"a",encoding = 'utf-8')

myDic = {}

import re

def isAward(s):
    #if bool(re.match("[0-9] [0-9] [0-9] [0-9] [0-9]",s)):
        #print (s + 'ok!')
    #else:
        #print (s + "no")
    return bool(re.match("[0-9] [0-9] [0-9] [0-9] [0-9]",s))

last = ''

for td in soupBoard:
    #x = input('hi:')
    #if str(td).find('class="award-winNum"') != -1:
        #print(str(td),str(td).find('class="award-winNum"'))
    #    print(td.text)
    #output.write(td.text)
    if isAward(td.text):
        myDic[last] = td.text
    last = td.text


for a in sorted(myDic.keys()):
    output.write(a)
    output.write("\n")
    output.write(myDic[a])
    output.write("\n")
    
output.close();