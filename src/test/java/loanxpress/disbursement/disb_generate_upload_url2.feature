Feature: Generate Upload URL

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/PD/pd_owner_login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en;q=0.9', authorization: '#(token)', 'content-type': 'application/json', origin: 'https://ilos-uat.capriglobal.in', priority: 'u=1, i', referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Not A(Brand";v="8", "Chromium";v="132", "Google Chrome";v="132"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' }

  @Sanity1 @tc0010
  Scenario: Generate upload URL for document
    Given path '/misc/generate-upload-url'
    * def requestBody = { app_id: '#(APP_ID)', dsn: 'OTHERS=ADDITIONAL-DOCUMENT', ext: 'pdf', fn: 'axis-bank-file_2.pdf', ft: 'application/pdf' }
    * request requestBody
    When method POST
    Then status 200
    And print 'Response:', response
