Feature: User submits application status update for multiple applicants

  Background:
     * url BASE_URL_PD
    * def result = call read('classpath:loanxpress/PD/pd_owner_login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
      * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Priority: 'u=1, i', Referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site' }

  @Sanity1 @tc0020
  Scenario: Automate application status update for first applicant with positive status
    Given path '/application/status'
    And request {"appId":"#(APP_ID)","status":"POSITIVE","remark":"","collateral_type":""}
    When method POST    
    Then status 200
    Then print 'Response for first applicant application status:', response