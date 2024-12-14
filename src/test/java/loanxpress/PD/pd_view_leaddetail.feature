Feature: User view the lead details for a specific application ID

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = {Authorization: '#(token)', Accept: 'application/json, text/plain, */*','User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',Origin: 'https://ilos-uat.capriglobal.in',Referer: 'https://ilos-uat.capriglobal.in/'}

  @Sanity1 @tc0008
  Scenario: Retrieve lead details for the given application ID
    Given path 'lead/lead-detail'
    And param application_id = APP_ID
    When method GET
    Then status 200
    And print 'Response:', response
