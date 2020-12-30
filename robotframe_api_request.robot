*** Settings ***
#Library     ExtendedRequestsLibrary
Library         HttpCtrl.Client
Library     RequestsLibrary
Library     HttpCtrl.Server
Library     XML
Library     Collections
Library     String
Library     JSONLibrary
#Library     JSONLibrary

#Library     HttpLibrary.HTTP

*** Variables ***
${url} =      https://webservice.eppo.go.th/eppowebservice
#&{headers}  Content-Type=application/soap+xml  or text/xml

*** Test Case ***
# headers=${headers}    headers=${headers}
# Sleep     5
API Post Request
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
#    ${data}=      Split String    ${child_data[1:-1]}   ,
    ${data}=      CONVERT STRING TO JSON      ${child_data}
    ${data_length}=      get length       ${data}
    log to console         ${data_length}
#    log to console      ${data[0]}
#    FOR     ${single_data}      IN         @{data}
    FOR     ${single_data}      IN RANGE    0    ${data_length}
        ${yy}=     convert to string        ${data[${single_data}]['yy']}
        ${mm}=     convert to string        ${data[${single_data}]['mm']}
        ${qty1}=     convert to string        ${data[${single_data}]['qty1']}
        ${qty2}=     convert to string        ${data[${single_data}]['qty2']}
        ${qty3}=     convert to string        ${data[${single_data}]['qty3']}
        ${qty4}=     convert to string        ${data[${single_data}]['qty4']}
        ${qty5}=     convert to string        ${data[${single_data}]['qty5']}
        ${qty6}=     convert to string        ${data[${single_data}]['qty6']}
        ${qty7}=     convert to string        ${data[${single_data}]['qty7']}
        ${qty8}=     convert to string        ${data[${single_data}]['qty8']}
        ${qty9}=     convert to string        ${data[${single_data}]['qty9']}
        ${qty10}=     convert to string        ${data[${single_data}]['qty10']}
        ${qty11}=     convert to string        ${data[${single_data}]['qty11']}
        ${qty12}=     convert to string        ${data[${single_data}]['qty12']}
        ${qty13}=     convert to string        ${data[${single_data}]['qty13']}
        ${qty14}=     convert to string        ${data[${single_data}]['qty14']}
        ${qty15}=     convert to string        ${data[${single_data}]['qty15']}
        ${qty16}=     convert to string        ${data[${single_data}]['qty16']}
        ${qty17}=     convert to string        ${data[${single_data}]['qty17']}
#        ${dict_data}=   CONVERT STRING TO JSON        ${string_data}
#        log to console       ${single_data['yy']}
#        log to console       ${single_data['mm']}
#        log to console       ${single_data['qty1']}
#        ${get_policy_id}=  Set variable    ${single_data['yy']}
#        log to console    @{data[${single_data}]}
#        Log Many   yy=        ${string_data}
        ${round}=   Evaluate    ${single_data}+1
        log to console   round=${round}
        log to console   yy=${yy}
        log to console   mm=${mm}
        log to console   qty1=${qty1}
        log to console   qty2=${qty2}
        log to console   qty3=${qty3}
        log to console   qty4=${qty4}
        log to console   qty5=${qty5}
        log to console   qty6=${qty6}
        log to console   qty7=${qty7}
        log to console   qty8=${qty8}
        log to console   qty9=${qty9}
        log to console   qty10=${qty10}
        log to console   qty11=${qty11}
        log to console   qty12=${qty12}
        log to console   qty13=${qty13}
        log to console   qty14=${qty14}
        log to console   qty15=${qty15}
        log to console   qty16=${qty16}
        log to console   qty17=${qty17}
        log to console   \n
    END
#*** Keywords ***