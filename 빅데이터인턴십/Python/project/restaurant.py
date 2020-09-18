import requests
import bs4

endpoint = 'http://apis.data.go.kr/6300000/tourFoodDataService/tourFoodDataListJson?'
serviceKey = '4WL3rpgrWA3KqnYYeAHcpD%2B6w4QgYF6By2xloUCumceSaddda5Wkam2h%2B%2BD8CrJuICJD309Bymhp7i%2Bd9a37yw%3D%3D'
dgu = 'C0602'
pageNo = '1'
numOfRows = '10'

paramset = 'serviceKey=' + serviceKey + '&pageNo=' + pageNo + '&numOfRows=' + numOfRows + '&dgu=' + dgu

url = endpoint + paramset
result = requests.get(url).json()
print(result)
print(result['msgBody'])
# bs_obj = bs4.BeautifulSoup(result.content, 'html.parser')
# print(bs_obj)