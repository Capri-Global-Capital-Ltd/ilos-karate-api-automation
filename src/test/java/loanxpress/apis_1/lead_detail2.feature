Feature: User fetch the submitted lead details
  
  Background:
    * url BASE_URL1
    * print 'print 1'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'print 1 token', token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc00131
  Scenario Outline: submitted lead detail
    Given path '/assignee/lead'
      And param status = '<status>'
      And param page_size = 100
    When method GET
    Then status <statuscode>
    * def lastId = response.dt[response.dt.length - 1]._id
    * def lastap_no = response.dt[response.dt.length - 1].ap_no
    And print 'Response obj_id:', lastId
    And print 'Response application_id:', lastap_no

  Examples:
    | statuscode |status|
    | 200        | SUBMITTED |
    