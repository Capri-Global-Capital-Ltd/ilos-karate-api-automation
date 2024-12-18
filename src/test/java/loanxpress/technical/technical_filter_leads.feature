Feature: Filter lead at technical home page

  Background:
    * url BASE_URL1
    * print 'Starting test setup'
    * def loginResponse = call read('classpath:loanxpress/apis_1/login.feature')
    * def authToken = loginResponse.response.dt.token
    * print 'Authentication Token:', authToken
    * configure headers = { Authorization: '#(authToken)', Content-Type: 'application/json' }

  @Sanity1 @tc0013 @UW
  Scenario Outline: Viewing the filtered lead
    Given path '/technical/get-home-leads'
    And param role = "TC"
    And param application_id = APP_ID
    When method GET
    And print 'API Response:', response
    Then status <statuscode>
  
  Examples:
    | statuscode |
    | 200        |
    