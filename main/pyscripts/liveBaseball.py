import urllib
import urllib.request
import json

url = 'https://www.playsport.cc/livescore.php?aid=1'
class AppURLopener(urllib.request.FancyURLopener):
    version = "Mozilla/5.0"

opener = AppURLopener()

#response = urllib.request.urlopen(url)
response = opener.open(url)
html_doc = response.read()

from bs4 import BeautifulSoup
soup = BeautifulSoup(html_doc, 'html.parser')

divs = soup.find_all('div')

jsonList = []

for div in divs:
    
    if ( str(div.get('class')).find('gamebox-notend') != -1 and str(div.get('style')).find('display:block') != -1 ):
        nowJson = {}
        #print(div.get('id'))
        if(str(div.get('id')).find('preview')==-1):
            spans = div.find_all('span') 
            for span in spans:
                if( str(span.get('class')).find('teamname_highlight') != -1 ):
                    nowJson["teamHighlight"] = str(span.text)
            nowJson["start"] = '1'
            if(str(div).find("比賽暫停") != -1):
                print('pause')
                nowJson["pause"] = '1'
            else:
                nowJson["pause"] = '0'
            
            nowJson["data-namea"] = div.get('data-namea') # first team

            nowJson["data-nameh"] = div.get('data-nameh')
            
            nowJson["data-aheadprice"] = div.get('data-aheadprice')
            nowJson["data-aheadodds"] = div.get('data-aheadodds')
            bigScores = div.find_all('td',"big_score")
            nowJson["a-score"] = bigScores[0].text
            nowJson["h-score"] = bigScores[1].text

            gameState = div.find_all('div','game_state')
            #print('state len = ',len(gameState))
            if(len(gameState) > 0):
                stateDivs = gameState[0].find_all('div')
                if(len(stateDivs) >= 2):

                    leiBao = str(stateDivs[0].get('class'))
                    for i in range(len(leiBao)):
                        if (leiBao[i:i+1].isdigit()):
                            nowJson["baseState"] = leiBao[i:i+1]

                    

                    nowJson["inning"] = str(stateDivs[0].text).replace(" ","").replace("\n","")

                    sboSpans = stateDivs[1].find_all('span')

                    nowJson["s"] = 0
                    nowJson["b"] = 0
                    nowJson["o"] = 0
                    i = 0
                    for span in sboSpans:
                        if(str(span.get('class')).find('liteoff') == -1) :
                            if(i<2):
                                nowJson["s"] = nowJson["s"] + 1
                            elif(i<5):
                                nowJson["b"] = nowJson["b"] + 1
                            else:
                                nowJson["o"] = nowJson["o"] + 1
                        i = i + 1

                    nowJson["s"] = str(nowJson["s"])
                    nowJson["b"] = str(nowJson["b"])
                    nowJson["o"] = str(nowJson["o"])
                    nowJson["turnKey"] = '0'
                else:
                    nowJson["turnKey"] = '1'
            else:
                nowJson["turnKey"] = '1'

            gameTable = div.find_all('table',"scorebox")
            tds = gameTable[0].find_all('td') 
            gameNum = 1
            asList = []
            hsList = []
            #asR
            #asH
            #asE
            while(1):
                key = 0
                for td in tds:
                    if( str(td.get('id')).find('as'+str(gameNum))!=-1 and str(td.text).replace(" ","").replace("\n","")!=""):
                        asList.append(str(td.text).replace(" ","").replace("\n",""))
                        key = 1
                    if( str(td.get('id')).find('hs'+str(gameNum))!=-1 and str(td.text).replace(" ","").replace("\n","")!=""):
                        hsList.append(str(td.text).replace(" ","").replace("\n",""))
                        key = 1
                if(key==0):
                    break
                gameNum = gameNum + 1


            nowJson["a_score"] = asList
            nowJson["h_score"] = hsList

            teamStr = ["as","hs"]
            rheStr = ["r","h","e"]


            for td in tds:
                for ts in teamStr:
                    for rs in rheStr:
                        if( str(td.get('id')).find(ts+rs) != -1 ):
                            nowJson[ts+rs] = str(td.text).replace(" ","").replace("\n","")
            jsonList.append(nowJson)



            
        else:
            #print('not start')
            nowJson["start"] = '0'
            nowJson["data-namea"] = str(div.find('td','team_left').text)
            nowJson["data-nameh"] = str(div.find('td','team_right').text)
            nowJson["startTime"] =  str(div.find('td','team_cinter').text)
            jsonList.append(nowJson)

import json

#output = open("/home/qeayg91ioeue/public_html/documents/baseball_live.json","w",encoding='utf-8')
output = open("../documents/liveBaseball.json","w",encoding='utf-8')
output.write(json.dumps(jsonList,ensure_ascii=False))
#print(jsonList)
        