Feature: Fetch the master data from pragati
  
  Background:
    * url BASE_URL1
    * print 'print 1'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'print 1 token', token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity @tc0003
  Scenario Outline: Viewing the master data
    Given path '/assignee/lead/'
    When method GET
    Then status <statuscode>
    And print 'Response application_id:', response.dt.application_id

  Examples:
    | statuscode |
    | 200        |