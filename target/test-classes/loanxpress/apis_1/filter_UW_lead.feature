Feature: User edits the lead details
  
  Background:
    * url BASE_URL1
    * print 'print 1'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * def result1 = call read('classpath:loanxpress/apis_1/lead_detail.feature')
    * def app1 = result1.response.dt.application_id
    * print 'Extracted application_id:', app1
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc0009
  Scenario Outline: Editing lead detail
    Given path '/underwriter/lead'
    And param status = '<status>'
        And print 'Response print app1:', app1
    And param application_id = app1
    When method GET
    Then status <statuscode>
    And print 'Response:', response

  Examples:
    | status           | statuscode |
    | PENDING_FOR_DDE  | 200        |
