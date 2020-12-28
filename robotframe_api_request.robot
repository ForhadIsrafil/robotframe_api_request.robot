*** Settings ***
#Library     ExtendedRequestsLibrary
Library         HttpCtrl.Client
Library     RequestsLibrary
Library     HttpCtrl.Server
Library     XML
Library     Collections
Library     String
#Library     JSONLibrary

#Library     HttpLibrary.HTTP

*** Variables ***
${url} =      https://webservice.eppo.go.th/eppowebservice
#&{headers}  Content-Type=application/soap+xml  or text/xml

*** Test Case ***
# headers=${headers}    headers=${headers}
# Sleep     5
Post Request
    create session    mysession   ${url}    verify=True     disable_warnings=1
    ${body}=  convert to string     <?xml version="1.0" encoding="utf-8"?> <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> <soap:Body> <GetLPGDemandSupplyMonthlyJSON xmlns="https://webservice.eppoengdb.go.th/"> <strUser>set</strUser> <strPassword>set</strPassword> <yy></yy> <mm></mm> </GetLPGDemandSupplyMonthlyJSON> </soap:Body> </soap:Envelope>
    ${header}=      create dictionary    Content-Type=text/xml  # application/soap+xml  or
    ${response}=    post request    mysession   /Energy_statistic.asmx?WSDL   data=${body}        headers=${header}
    log to console      ${response.status_code}
#    log to console      ${response.content}

    # all validations
    ${status_code}=    convert to string  ${response.status_code}
    should be equal    ${status_code}       200

    ${response_body}=  convert to string  ${response.content}
    ${xml_data}=  parse xml     ${response_body}
    ${child_elements}=  get child elements      ${xml_data}
    ${child_data}=  get element text    ${child_elements[0]}
#    log to console      ${child_data}

#*** Keywords ***