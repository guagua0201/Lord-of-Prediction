# -*- coding: utf-8 -*-
"""
Created on Tue Feb 12 03:25:31 2019

@author: yu-pu
"""
import urllib
import urllib.request
import urllib.parse
import requests

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

ballList = ['bj','by','bb','hb','bq','lq','cq','wq','mz','zq'] 
fileList = ['USbase','JPbase','TWbase','KRbase','iceball','basketball','lotteryball','tennis','football','soccer']

for cate in range(10):
    print("now = " + fileList[cate])
    outFile = open("./" + fileList[cate] + ".txt","w",encoding='utf-8')
    outFile.close()
    outFile = open("./" + fileList[cate] + ".txt","a",encoding='utf-8')
    nowUrl = 'http://ag.tg999.net/tw/ds.php?gid=' + gid + '&ball=' + ballList[cate]
    nowPage = 1

    while(1):
    
        lq = s.get( nowUrl )
        
        soup = BeautifulSoup(lq.text,'html.parser')
        
        tables = soup.find_all('table')
        
        for table in tables:
            if(str(table.get('id')).find('datatable')!=-1):
                dataTable = table
        
        
        trs = dataTable.find_all('tr')
        
        for tr in trs:
            if(str(tr.get('class')).find('td1') != -1 or str(tr.get('class')).find('td2') !=-1):
                tds = tr.find_all('td')
                for td in tds:
                    ss = str(td.text).replace("\n","").replace("\r","")
                    if(ss=="查看"):
                        continue
                    #print(ss)
                    outFile.write(ss+'\n')
                #print('------')
        
        #allA = soup.find_all('a')
        #for a in allA:
        #    if(str(a.text).find('下一頁')!=-1):
        
        if(str(lq.text).find('下')!=-1):
            nowPage = nowPage+1
            nowUrl = 'http://ag.tg999.net/tw/ds.php?gid=' + gid + '&ball='+ballList[cate]+'&pagx=15&page=' + str(nowPage)
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
            
    






