Feature: User Filtering the lead of Underwriting module

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }


  @Sanity1 @tc0018
 Scenario Outline: Filtering lead detail
    Given path '/underwriter/lead/assigned/list'
    And param application_id = APP_ID
    When method GET
    Then status <statuscode>
    And print 'Response:', response

  Examples:
    | status           | statuscode |
    | PENDING_FOR_DDE  | 200        |
    
    
    @Sanity1 @tc0013 @UW
  Scenario Outline: Viewing lead detail
    Given path '/assignee/lead/' + OBJ_ID
    When method GET
    Then status <statuscode>
    And print 'Response application_id:', response.dt.application_id
    And print 'Primary customer_id:', response.dt.applicant.primary.id
    And print 'Co App customer_id:', response.dt.applicant.co_applicant[0].id
    And print 'Guarantor customer_id:', response.dt.applicant.guarantors[0].id

  Examples:
    | statuscode |
    | 200        |

    
       @Sanity1 @tc0014
  Scenario Outline: Viewing lead result of UW
    Given path '/underwriter/lead/result/' + OBJ_ID
    When method GET
    Then status <statuscode>
   

  Examples:
    | statuscode |
    | 200        |
    