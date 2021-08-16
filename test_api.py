import requests
import xml


class Req(object):
    def req(self):
        url = 'https://**.**.go.th/**/**.asmx?**'

        header = {'Content-Type': 'text/xml'}

        body = '<?xml version="1.0" encoding="utf-8"?> <soap:Envelope xmlns:xsi="http://www.**.org/***/XMLSchema-instance" xmlns:xsd="http://www.****.org/***/XMLSchema" xmlns:soap="http://schemas.***.org/**/**/"> <soap:Body> <GetLPGDemandSupplyMonthlyJSON xmlns="https://webservice.eppoengdb.go.th/"> <strUser>set</strUser> <strPassword>set</strPassword> <yy></yy> <mm></mm> </GetLPGDemandSupplyMonthlyJSON> </soap:Body> </soap:Envelope>'

        res = requests.post(url, data=body, headers=header)
        print(res.status_code)
        print(res.content)
        return res
