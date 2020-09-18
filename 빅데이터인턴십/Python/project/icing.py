import requests

endpoint = 'http://apis.data.go.kr/B552061/frequentzoneFreezing/getRestFrequentzoneFreezing'

ServiceKey = '4WL3rpgrWA3KqnYYeAHcpD%2B6w4QgYF6By2xloUCumceSaddda5Wkam2h%2B%2BD8CrJuICJD309Bymhp7i%2Bd9a37yw%3D%3D'
searchYearCd = '2017'
siDo = '11'
guGun = '110'
numOfRows = '100'
pageNo='1'

parameters = f'ServiceKey={ServiceKey}&searchYearCd={searchYearCd}&siDo={siDo}&guGun={guGun}&numOfRows={numOfRows}&pageNo={pageNo}&type=json'
url = endpoint + '?' + parameters

print(url)

result = requests.get(url)

print(result.text)