Feature: Retrieve PD Meta List for a specific application ID

  Background:
    * url BASE_URL_PD
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Accept-Language': 'en-GB,en;q=0.9', Origin: 'https://ilos-uat.capriglobal.in', Referer: 'https://ilos-uat.capriglobal.in/', 'Sec-CH-UA': '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"', 'Sec-CH-UA-Mobile': '?0', 'Sec-CH-UA-Platform': '"Linux"', 'Sec-Fetch-Dest': 'empty', 'Sec-Fetch-Mode': 'cors', 'Sec-Fetch-Site': 'same-site', Priority: 'u=1, i' }


  @Sanity1 @tc0009
  Scenario: Retrieve PD Meta List for the application ID
    Given path '/pdmeta/list/' + APP_ID
    When method GET
    Then status 200
    And print 'Response:', response
    And match response != null
