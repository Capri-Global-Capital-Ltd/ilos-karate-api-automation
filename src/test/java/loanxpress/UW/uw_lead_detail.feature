Feature: User fetch the lead details of Underwriting module
  
  Background:
    * url BASE_URL1
    * print 'print 1'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'print 1 token', token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

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
    
    
      @Sanity1 @tc00011 @UW
  Scenario: Submit UW lead - Step 1
    Given path '/application/generate-pdf/' + APP_ID
    When method GET
    Then status 200
    * print 'Status code is:', responseStatus  