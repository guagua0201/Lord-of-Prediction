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

ballList = ['bq', 'lq', 'dj', 'bj'] 
fileList = ['27', '13', '31', '7']

for cate in range(4):
    print("now = " + fileList[cate])
    outFile = open("../documents/predictGame/" + fileList[cate] + ".csv","w",encoding='utf-8', newline='')
    outFile.close()
    outFile = open("../documents/predictGame/" + fileList[cate] + ".csv","a",encoding='utf-8', newline='')
    writer = csv.writer(outFile)
    nowUrl = 'http://ag.tg999.net/tw/ds.php?gid=' + gid + '&ball=' + ballList[cate]
    nowPage = 1

    th_list = []

    while(True):
        lq = s.get(nowUrl)
        soup = BeautifulSoup(lq.text, 'html.parser')
        

        tables = soup.find_all('table')
        for table in tables:
            if str(table.get('id')).find('datatable') != -1:
                dataTable = table

        ths = dataTable.find_all('th')
        data = []
        if nowPage == 1:
            for th in ths:
                th_list.append(str(th.text))
                if (th_list[-1] == '比賽時間'):
                    for i in range(2):
                        data.append('比賽時間')
                elif (th_list[-1] == '主客隊'):
                    for i in range(2):
                        data.append('主客隊')
                elif (th_list[-1] == '讓分'):
                    for i in range(4):
                        data.append('讓分')
                elif (th_list[-1] == '大小'):
                    for i in range(3):
                        data.append('大小')
                elif (th_list[-1] == '獨贏'):
                    for i in range(2):
                        data.append('獨贏')
                elif (th_list[-1] == '一輸二贏'):
                    for i in range(4):
                        data.append('一輸二贏')
                elif (th_list[-1] == '單雙'):
                    for i in range(2):
                        data.append('單雙')
            writer.writerow(data)

        trs = dataTable.find_all('tr')
        for tr in trs:
            data = []
            if str(tr.get('class')).find('td1') != -1 or str(tr.get('class')).find('td2') != -1:
                tds = tr.find_all('td')
                index = 0
                for td in tds:
                    if th_list[index] == '比賽時間':
                        for x in str(td.text).split(' '):
                            data.append(x)
                    elif th_list[index] == '主客隊':
                        if (td.find('span', class_='t-c4') == None):
                            team = str(td.text).strip(' \t\n\r').split('\n', 1)
                            team[0] = team[0][:len(team[0]) - 8]
                            data.append(team[0])
                            data.append(team[1])
                        else:
                            # print (repr(td.text), td.text.find('('))
                            team0 = td.text[:td.text.find('(')].strip(' \n\r\xa0')
                            team1 = td.find('span', class_='t-c2').text
                            data.append(team0)
                            data.append(team1)
                        # 2 column team1, team2
                    elif th_list[index] == '讓分':
                        t1 = td.find('div', class_='t1')
                        t2 = td.find('div', class_='t2')
                        if t1 != None and t2 != None:
                            br = str(t1).find('<br/>')
                            txt = str(t1).find(str(t1.text))
                            if (br < txt):
                                data.append('')
                                data.append(str(t1.text))
                            else:
                                data.append(str(t1.text))
                                data.append('')
                            for x in str(t2.text).replace('\xa0\n\xa0', ' ').strip('\n\xa0').split(' '):
                                data.append(x)
                            # print (str(t1.text))
                            # print (str(t2.text).replace('\xa0\n\xa0', ' ').strip('\n\xa0').split(' '))
                            # 4 column up->t1 down->t1 bet1, bet2
                        else:
                            for i in range(4):
                                data.append('')
                    elif th_list[index] == '大小':
                        t1 = td.find('div', class_='t1')
                        t2 = td.find('div', class_='t2')
                        if t1 != None and t2 != None:
                            t2s = str(t2.text)
                            posx = t2s.find('大')
                            posy = t2s.find('小')
                            data.append(str(t1.text).strip(' \n\r'))
                            data.append(t2s[posx + 2: posx + 7])
                            data.append(t2s[posy + 2: posy + 7])
                            # print (str(t1.text).strip(' \n\r'))
                            # print (t2s[posx + 2:posx + 7], t2s[posy + 2:posy + 7])
                            # 3 column t1 bet1 bet2
                        else:
                            for i in range(3):
                                data.append('')
                    elif th_list[index] == '獨贏':
                        t2 = td.find('div', class_='t2')
                        for x in str(t2.text).lstrip('\n').rstrip('\xa0\n').replace('\xa0\n', ' ').split(' '):
                            data.append(x)
                        # print (str(t2.text).lstrip('\n').rstrip('\xa0\n').replace('\xa0\n', ' '))
                        # 2 column bet1 bet2
                    elif th_list[index] == '一輸二贏':
                        t1 = td.find('div', class_='t1')
                        t2 = td.find('div', class_='t2')
                        if t1 != None and t2 != None:
                            br = str(t1).find('br')
                            txt = str(t1).find(str(t1.text))
                            if (br < txt):
                                data.append('')
                                data.append(str(t1.text).strip(' \xa0'))
                            else:
                                data.append(str(t1.text).strip(' \xa0'))
                                data.append('')
                            for x in str(t2.text).lstrip('\n\xa0').rstrip('\xa0\n').replace('\xa0\n\xa0', ' ').split(' '):
                                data.append(x)
                            # print (str(t1.text).strip(' \xa0'))
                            # print (repr(str(t2.text).lstrip('\n\xa0').rstrip('\xa0\n').replace('\xa0\n\xa0', ' ')))
                            # 4 column up->t1 down->t1 bet1 bet2
                        else:
                            for i in range(4):
                                data.append('')
                    elif th_list[index] == '單雙':
                        t2 = td.find('div', class_='t2')
                        if t2 != None:
                            t2s = str(t2.text)
                            posx = t2s.find('單')
                            posy = t2s.find('雙')
                            data.append(t2s[posx + 2: posx + 7])
                            data.append(t2s[posy + 2: posy + 7])
                        else:
                            for i in range(2):
                                data.append('')
                        # print (t2s[posx + 2: posx + 7], t2s[posy + 2:posy + 7])
                        # 2 column bet1 bet2

                    ss = str(td.text).strip(' \t\n\r')  
                    index = index + 1
                writer.writerow(data)

        if str(lq.text).find('下') != -1:
            nowPage = nowPage + 1
            nowUrl = 'http://ag.tg999.net/tw/ds.php?gid=' + gid + '&ball=' + ballList[cate] + '&pagx=15&page=' + str(nowPage)
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
