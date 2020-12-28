import requests
import xml


class Req(object):
    def req(self):
        url = 'https://webservice.eppo.go.th/eppowebservice/Energy_statistic.asmx?WSDL'

        header = {'Content-Type': 'text/xml'}

        body = '<?xml version="1.0" encoding="utf-8"?> <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> <soap:Body> <GetLPGDemandSupplyMonthlyJSON xmlns="https://webservice.eppoengdb.go.th/"> <strUser>set</strUser> <strPassword>set</strPassword> <yy></yy> <mm></mm> </GetLPGDemandSupplyMonthlyJSON> </soap:Body> </soap:Envelope>'

        res = requests.post(url, data=body, headers=header)
        print(res.status_code)
        print(res.content)
        return res
