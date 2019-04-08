import urllib
import urllib.request
import urllib.parse
import requests
import string
import json

URL = "http://ag.tg999.net/tw/login.php"
s = requests.Session()

response = urllib.request.urlopen(URL)
html_doc = response.read()

from bs4 import BeautifulSoup
soup = BeautifulSoup(html_doc, 'html.parser')

form = soup.find('form')
fields = form.find_all("input")

formdata = dict( (field.get('name'), field.get('value')) for field in fields)

formdata['user'] = u'abrn529'
formdata['pass'] = u'aaa888'

posturl = urllib.parse.urljoin(URL, form['action'])
print (posturl)

r = s.post(posturl, data=formdata)
soup = BeautifulSoup(r.text, 'html.parser')

frames = soup.find_all('frame')

print(r.url)
gid = str(r.url)[str(r.url).find('gid=')+4:]
print(gid)

ballList = ['bq', 'lq', 'dj', 'bj', 'bb', 'by', 'hb'] 
fileList = ['27', '13', '31', '7', '9', '8', '10']

for cate in range(7):
    print("now = " + fileList[cate])
    outFile = open("../documents/predictGame/" + fileList[cate] + ".json","w",encoding='utf-8', newline='')
    nowUrl = 'http://ag.tg999.net/tw/ds.php?gid=' + gid + '&ball=' + ballList[cate]
    nowPage = 1

    th_list = []
    title_list = []
    ok = True
    first_title = ''

    all_games = []
    while(True):
        lq = s.get(nowUrl)
        soup = BeautifulSoup(lq.text, 'html.parser')

        tables = soup.find_all('table')
        for table in tables:
            if str(table.get('id')).find('datatable') != -1:
                dataTable = table
                break

        td11 = dataTable.find('td', class_='td1-1')
        if td11 != None:
            if td11.text.find('目前尚無資料') != -1:
                break

        ths = dataTable.find_all('th')
        if nowPage == 1:
            for th in ths:
                th_list.append(str(th.text))

        trs = dataTable.find_all('tr')
        for tr in trs:
            title = tr.find('td', class_='t_titlebar')
            if title != None:
                tt = title.span.text[:title.span.text.find('-')]
                if tt not in title_list or title == first_title or first_title == '' or title == 'MLB 美國職棒-國聯-全場' or title == 'MLB 美國職棒-美聯-全場' or title == 'MLB 美國職棒-跨聯盟-全場':
                    ok = True
                    first_title = title
                    title_list.append(tt)
                else:
                    ok = False

            if ok and (str(tr.get('class')).find('td1') != -1 or str(tr.get('class')).find('td2') != -1):
                tds = tr.find_all('td')
                index = 0
                json_data = {}
                details = json_data['details'] = {}
                for td in tds:
                    if th_list[index] == '比賽時間':
                        json_data['date'], json_data['time'] = td.text.split(' ')

                    elif th_list[index] == '主客隊':
                        if (td.find('span', class_='t-c4') == None):
                            team = str(td.text).strip(' \t\n\r').split('\n', 1)
                            team[0] = team[0][:len(team[0]) - 8]
                            json_data['a_name'] = team[0]
                            json_data['h_name'] = team[1]
                        else:
                            team0 = td.text[:td.text.find('(')].strip(' \n\r\xa0')
                            team1 = td.find('span', class_='t-c2').text
                            json_data['a_name'] = team0
                            json_data['h_name'] = team1

                    elif th_list[index] == '讓分':
                        t1 = td.find('div', class_='t1')
                        t2 = td.find('div', class_='t2')
                        if t1 != None and t2 != None:
                            handicap = details['handicap'] = {}

                            br = str(t1).find('<br/>')
                            txt = str(t1).find(t1.text)
                            if t1.text.find('+') != -1:
                                if br < txt:
                                    handicap['h_spread'] = int(t1.text.split('+')[0])
                                else:
                                    handicap['a_spread'] = int(t1.text.split('+')[0])
                                handicap['tie_odds'] = int(t1.text.split('+')[1])
                            elif t1.text.find('-') != -1:
                                if br < txt:
                                    handicap['h_spread'] = int(t1.text.split('-')[0])
                                else:
                                    handicap['a_spread'] = int(t1.text.split('-')[0])
                                handicap['tie_odds'] = -1 * int(t1.text.split('-')[1])
                            elif t1.text.find('PK') != -1:
                                if br < txt:
                                    handicap['h_spread'] = 0
                                else:
                                    handicap['a_spread'] = 0
                            elif t1.text.find('平'):
                                if br < txt:
                                    handicap['h_spread'] = int(t1.text.strip('平'))
                                else:
                                    handicap['a_spread'] = int(t1.text.strip('平'))

                            h_odds = str(t2.text).replace('\xa0\n\xa0', ' ').strip('\n\xa0').split(' ')
                            handicap['a_odds'] = float(h_odds[0])
                            handicap['h_odds'] = float(h_odds[1])

                    elif th_list[index] == '大小':
                        t1 = td.find('div', class_='t1')
                        t2 = td.find('div', class_='t2')
                        if t1 != None and t2 != None:
                            total = details['total'] = {}

                            t2s = t2.text
                            posx = t2s.find('大')
                            posy = t2s.find('小')

                            total_info = t1.text.strip(' \n\r')
                            if total_info.find('+') != -1:
                                total['point'] = int(total_info.split('+')[0])
                                total['tie_odds'] = int(total_info.split('+')[1])
                            elif total_info.find('-') != -1:
                                total['point'] = int(total_info.split('-')[0])
                                total['tie_odds'] = -1 * int(total_info.split('-')[1])
                            elif total_info.find('平') != -1:
                                total['point'] = int(total_info.strip('平'))
                            total['over_odds'] = float(t2s[posx + 2: posx + 7])
                            total['under_odds'] = float(t2s[posy + 2: posy + 7])

                    elif th_list[index] == '獨贏':
                        t2 = td.find('div', class_='t2')

                        single = details['single'] = {}
                        s_odds = str(t2.text).lstrip('\n').rstrip('\xa0\n').replace('\xa0\n', ' ').split(' ')
                        single['a_odds'] = float(s_odds[0])
                        single['h_odds'] = float(s_odds[1])

                    elif th_list[index] == '一輸二贏':
                        t1 = td.find('div', class_='t1')
                        t2 = td.find('div', class_='t2')
                        if t1 != None and t2 != None:
                            one_lose_two_win = details['one_lose_two_win'] = {}

                            br = str(t1).find('br')
                            txt = str(t1).find(str(t1.text))
                            if (br < txt):
                                one_lose_two_win['h_spread'] = 1
                            else:
                                one_lose_two_win['a_spread'] = 1
                            o_odds = str(t2.text).lstrip('\n\xa0').rstrip('\xa0\n').replace('\xa0\n\xa0', ' ').split(' ')
                            one_lose_two_win['a_odds'] = float(o_odds[0])
                            one_lose_two_win['h_odds'] = float(o_odds[1])

                    elif th_list[index] == '單雙':
                        t2 = td.find('div', class_='t2')
                        if t2 != None:
                            odd_even = details['odd_even'] = {}
                            odd_even['odd_odds'] = float(t2.find_all('span')[0].text.strip(' \n\r\xa0'))
                            odd_even['even_odds'] = float(t2.find_all('span')[1].text.strip(' \n\r\xa0'))
                    index = index + 1
                if json_data != {}:    
                    all_games.append(json_data)

        if str(lq.text).find('下') != -1:
            nowPage = nowPage + 1
            nowUrl = 'http://ag.tg999.net/tw/ds.php?gid=' + gid + '&ball=' + ballList[cate] + '&pagx=15&page=' + str(nowPage)
        else:
            break
    json.dump(all_games, outFile, ensure_ascii=False, indent=4)
    outFile.close()




#BASE_URL = r.url

#for frame in frames:
#    if(str(frame.get('id')).find('menuframe')!=-1):
#        nowFrame = s.get(urllib.parse.urljoin(BASE_URL, frame.get('src')))
#        soup = BeautifulSoup(nowFrame.text, 'html.parser')
#        lis = soup.find_all('li')
        #for li in lis:
            #print(li.find("a").get("onclick"))
