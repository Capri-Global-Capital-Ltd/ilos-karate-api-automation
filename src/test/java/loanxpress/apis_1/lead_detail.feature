Feature: Fetch the lead details
  
  Background:
   * url BASE_URL1
   * print 'print 1'
   * def result = call read('classpath:loanxpress/apis_1/login.feature')
   * def token = result.response.dt.token
   * print 'print 1 token', token
   * configure headers = {Authorization: '#(token)',Content-Type:'application/json'}

 
     @Sanity1 @tc0003
   Scenario Outline: Viewing lead detail
    Given path '/assignee/lead/6614da4cd12a151ad776c74e'
    When method GET
    Then status <statuscode>
    And print 'Response:', response

  Examples:
   | statuscode |
   | 200        |
