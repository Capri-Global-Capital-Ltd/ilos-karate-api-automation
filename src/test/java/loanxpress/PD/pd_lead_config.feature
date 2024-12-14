Feature: User verifies the lead configuration for PD initiation

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Referer: 'https://ilos-uat.capriglobal.in/', 'Sec-CH-UA': '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"', 'Sec-CH-UA-Mobile': '?0', 'Sec-CH-UA-Platform': '"Linux"', 'Sec-Fetch-Dest': 'empty', 'Sec-Fetch-Mode': 'cors', 'Sec-Fetch-Site': 'same-site' }

  @Sanity1 @tc0009
  Scenario: Retrieve lead configuration for PD initiation
    Given path 'misc/lead-config'
    And param section = 'pd_initiation'
    When method GET
    Then status 200
    And print 'Response:', response
