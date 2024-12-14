Feature: Automate PD Meta Save Request API

  Background:
    * url BASE_URL_PD
    * def loginResponse = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = loginResponse.response.dt.token
    * print 'Token:', token
  
   * def pd_lead_processor = call read('classpath:loanxpress/PD/pd_lead_processor.feature')
    * def pdid1 = pd_lead_processor.response.result[0].id
    * def pdid2 = pd_lead_processor.response.result[1].id
    * def pdid3 = pd_lead_processor.response.result[2].id

    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Priority: 'u=1, i', Referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site' }

  @Sanity1 @tc0020
  Scenario: Automate PD Meta Save Request with dynamic pdId mapping
    Given path '/pdmeta/saveRequest'
    And request {"applicationId":"#(APP_ID)","applicantId":"921466","isReferredBranchView":false,"pdRequestList":[{"pdId":"#(pdid1)","empId":"BU0005","empName":"Jaipragatiuser15"},{"pdId":"#(pdid2)","empId":"BU0005","empName":"Jaipragatiuser15"},{"pdId":"#(pdid3)","empId":"BU0005","empName":"Jaipragatiuser15"}]}
    When method POST    
    Then status 200
    Then print 'Response for applicant customer detail:', response
    * print 'PDID 1:', pdid1
    * print 'PDID 2:', pdid2
    * print 'PDID 3:', pdid3


   