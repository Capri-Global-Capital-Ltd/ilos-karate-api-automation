Feature: User filters and assigns a lead from UW

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * def result1 = call read('classpath:loanxpress/apis_1/lead_detail2.feature')
    * def obj_id = result1.lastId
    * def application_id = result1.lastap_no
    * print 'Extracted application_id:', application_id
    * print 'Extracted object_id:', obj_id
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc00131
  Scenario Outline: Filtering lead detail
    Given path '/underwriter/lead'
    And param status = '<status>'
    And print 'Response print application_id:', application_id
    And param application_id = application_id  // Use the application_id from the previous step
    When method GET
    Then status <statuscode>
    And print 'Response:', response

  Examples:
    | status           | statuscode |
    | PENDING_FOR_DDE  | 200        |
