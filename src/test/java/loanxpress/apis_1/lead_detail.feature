Feature: User fetch the lead details
  
  Background:
    * url BASE_URL1
    * print 'print 1'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'print 1 token', token
    * def result1 = call read('classpath:loanxpress/apis_1/pending_listing.feature')
    * def id1 = result1.response.dt[0]._id
    * print 'Extracted ID1:', id1
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc0003
  Scenario Outline: Viewing lead detail
    Given path '/assignee/lead/' + id1
    When method GET
    Then status <statuscode>
    And print 'Response application_id:', response.dt.application_id

  Examples:
    | statuscode |
    | 200        |
