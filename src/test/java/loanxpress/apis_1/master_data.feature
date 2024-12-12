Feature: Fetch the master data from pragati
  
  Background:
    * url BASE_URL1
    * print 'print 1'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'print 1 token', token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc0003
  Scenario Outline: Viewing the master data
    Given path '/proxy/pragati/master-data'
    When method GET
    Then status <statuscode>
    

  Examples:
    | statuscode |
    | 200        |