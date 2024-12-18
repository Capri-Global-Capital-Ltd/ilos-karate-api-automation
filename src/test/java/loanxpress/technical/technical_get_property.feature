Feature: Filter property on the technical home page

  Background:
    * url BASE_URL1
    * print 'Initializing test setup'
    * def loginResponse = call read('classpath:loanxpress/apis_1/login.feature')
    * def authToken = loginResponse.response.dt.token
    * print 'Authentication Token:', authToken
    * configure headers = { Authorization: '#(authToken)', Content-Type: 'application/json' }

  @Sanity1 @tc0013 @UW
  Scenario Outline: Retrieve filtered property
    Given path '/technical/get-property-list'
    And param role = "TC"
    And param application_id = APP_ID
    When method GET
    And print 'Filtered Leads API Response:', response
    Then status <statuscode>
  
  Examples:
    | statuscode |
    | 200        |
