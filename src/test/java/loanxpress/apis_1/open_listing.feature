Feature: List of OPEN leads of CPU module
  
  Background:
    * url BASE_URL1
    * print 'print 1'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'print 1 token', token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc0004
  Scenario Outline: Viewing the pending leads
    Given path '/assignee/lead'
    And param status = '<status>'
    When method GET
    Then status <statuscode>
    * def objectid = response.dt[0]._id
    * print 'Extracted objectid:', objectid
    * eval karate.set('objectid', objectid) // Set objectid in response for retrieval
    * print 'Response:', response

  Examples:
    | status | statuscode |
    | OPEN   | 200        |
