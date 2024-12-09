Feature: User fetch the lead details
  
  Background:
    * url BASE_URL1
    * print 'print 1'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'print 1 token', token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc0013 @UW
  Scenario Outline: Viewing dedupe lead detail
    Given path '/assignee/lead/' + OBJ_ID
    When method GET
    Then status <statuscode>
  
  Examples:
    | statuscode |
    | 200        |