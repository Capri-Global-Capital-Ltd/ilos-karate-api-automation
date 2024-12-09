Feature: User filters and assigns a lead from UW

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc00131
  Scenario Outline: Filtering lead detail
    Given path '/underwriter/lead'
    And param status = '<status>'
    And param application_id = APP_ID  // Use the application_id from the previous step
    When method GET
    Then status <statuscode>
    And print 'Response:', response

  Examples:
    | status           | statuscode |
    | PENDING_FOR_DDE  | 200        |

  @Sanity1 @tc0018
  Scenario Outline: Assign the UW lead
    Given path '/underwriter/lead/self_assign/' + OBJ_ID
    When method PATCH    
    Then status <statuscode>
    And print 'Response for applicant customer detail:', response

  Examples:
    | statuscode |
    | 200        |
