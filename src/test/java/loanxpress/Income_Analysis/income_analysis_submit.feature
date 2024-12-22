Feature: Assigning the vendor from vendor list

  Background:
    * url BASE_URL1
    * print 'Initializing test setup'
    * def loginResponse = call read('classpath:loanxpress/apis_1/login.feature')
    * def authToken = loginResponse.response.dt.token
    * print 'Authentication Token:', authToken
    * configure headers = { Authorization: '#(authToken)', Content-Type: 'application/json' }

  @Sanity1 @tc0013 @UW
  Scenario Outline: Assigning the vendor
    Given path '/income-program/final-submit/' + OBJ_ID
    And request {"total_eligible_income":30000,"income_program":"nip"}
    When method POST      
    Then status 200
    And print 'Filtered lead response:', response
    And status <statuscode>
  
  Examples:
    | statuscode |
    | 200        |
