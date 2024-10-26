Feature: User Search via GLOBAL SEARCH
  
  Background:
   * url BASE_URL1
   * print 'print 1'
   * def result = call read('classpath:loanxpress/apis_1/login.feature')
   * def token = result.response.dt.token
   * print 'print 1 token', token
   * configure headers = {Authorization: '#(token)',Content-Type:'application/json'}

 
     @Sanity1 @tc0002
   Scenario Outline: Login successful and search
    Given path '/search'
    And param application_id = '<application_id>'
    And param page = '<page>'
    And param pageSize = '<pageSize>'
    When method GET
    Then status <statuscode>
    And print 'Response:', response

  Examples:
    | application_id | page | pageSize | statuscode |
    | 911039         | 1    | 5        | 200        |
