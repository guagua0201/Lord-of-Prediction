# -*- coding: utf-8 -*-
"""
Created on Tue Feb 12 03:25:31 2019

@author: yu-pu
"""
import urllib
import urllib.request
import urllib.parse
import requests
import string
import csv

URL = "http://ag.tg999.net/tw/login.php"
s = requests.Session()

response = urllib.request.urlopen(URL)
html_doc = response.read()

from bs4 import BeautifulSoup
soup = BeautifulSoup(html_doc, 'html.parser')

#print(soup)

form = soup.find('form')
fields = form.find_all("input")


formdata = dict( (field.get('name'), field.get('value')) for field in fields)

formdata['user'] = u'abrn529'
formdata['pass'] = u'aaa888'

#print(formdata)

posturl = urllib.parse.urljoin(URL, form['action'])
print (posturl)

r = s.post(posturl, data=formdata)
soup = BeautifulSoup(r.text, 'html.parser')

frames = soup.find_all('frame')

print(r.url)
gid = str(r.url)[str(r.url).find('gid=')+4:]
print(gid)

#&pagx=15&page=2

ballList = ['bq', 'lq', 'dj', 'bj', 'bb', 'by', 'hb'] 
fileList = ['27', '13', '31', '7', '9', '8', '10']

for cate in range(5):
    print("now = " + fileList[cate])
    outFile = open("../documents/historyGame/" + fileList[cate] + ".csv","w",encoding='utf-8', newline='')
    outFile.close()
    outFile = open("../documents/historyGame/" + fileList[cate] + ".csv","a",encoding='utf-8', newline='')
    writer = csv.writer(outFile)
    nowUrl = 'http://ag.tg999.net/tw/lsbs.php?gid=' + gid + '&ball=' + ballList[cate]
    nowPage = 1

    th_list = []
    title_list = []
    ok = True
    first_title = ''

    while(True):
        lq = s.get(nowUrl)
        soup = BeautifulSoup(lq.text, 'html.parser')

        dataTable = soup.find('table', id='datatable')
        # print (tables.prettify())

        td11 = dataTable.find('td', class_='td1-1').span
        if td11 != None:
            # print (td11.text.find('目前尚無資料'))
            if td11.text.find('目前尚無資料') != -1:
                break

        ths = dataTable.find_all('th')
        data = []
        if nowPage == 1:
            for th in ths:
                # print (str(th.text))
                th_list.append(str(th.text))
                if (th_list[-1] == '比賽時間'):
                    for i in range(2):
                        data.append('比賽時間')
                elif (th_list[-1] == '主客隊'):
                    for i in range(4):
                        data.append('主客隊')
            writer.writerow(data)

        trs = dataTable.find_all('tr')
        for tr in trs:
            data = []
            title = tr.find('td', class_='t_titlebar')
            if title != None:
                # print (title.span.text)
                tt = title.span.text[:title.span.text.find('-')]
                # print (tt, title, first_title, title_list)
                # print (title, title_list)
                if tt not in title_list or title == first_title or first_title == '':
                    ok = True
                    first_title = title
                    title_list.append(tt)
                else:
                    ok = False
                # if title.span.text[:title.span.text.find('-')]
            if ok == True:
                tds = tr.find_all('td')
                index = 0
                for td in tds:
                    if th_list[index] == '比賽時間':
                        for x in str(td.text).split(' '):
                            data.append(x)
                    elif th_list[index] == '主客隊':
                        split = td.text.split('\n')
                        sp1 = split[1].split(']')
                        sp2 = split[2].split(']')
                        # print(sp1[0].strip('['))
                        # print(sp1[1].strip(' \n\xa0'))
                        # print(sp2[0].strip('['))
                        # print(sp2[1].strip(' \n\xa0'))
                        data.append(sp1[0].strip('['))
                        data.append(sp1[1].strip(' \n\xa0'))
                        data.append(sp2[0].strip('['))
                        data.append(sp2[1].strip(' \n\xa0'))
                    index = index + 1
                if data != []:
                    writer.writerow(data)

        if str(lq.text).find('下') != -1:
            nowPage = nowPage + 1
            nowUrl = 'http://ag.tg999.net/tw/lsbs.php?gid=' + gid + '&ball=' + ballList[cate] + '&pagx=15&page=' + str(nowPage)
        else:
            break

    outFile.close()




#BASE_URL = r.url

#for frame in frames:
#    if(str(frame.get('id')).find('menuframe')!=-1):
#        nowFrame = s.get(urllib.parse.urljoin(BASE_URL, frame.get('src')))
#        soup = BeautifulSoup(nowFrame.text, 'html.parser')
#        lis = soup.find_all('li')
        #for li in lis:
            #print(li.find("a").get("onclick"))
