Feature: User view the list of all processors in cpu

  Background:
     * url BASE_URL_PD
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc0008
  Scenario: Retrieve list of user applications
    Given path '/application/list/myApplication/PROCESSOR/0/10'
    When method GET
    Then status 200
    And print 'Response:', response
  