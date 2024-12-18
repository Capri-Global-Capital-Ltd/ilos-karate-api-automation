Feature: Filter vendor list of the lead

  Background:
    * url BASE_URL1
    * print 'Initializing test setup'
    * def loginResponse = call read('classpath:loanxpress/apis_1/login.feature')
    * def authToken = loginResponse.response.dt.token
    * print 'Authentication Token:', authToken
    * configure headers = { Authorization: '#(authToken)', Content-Type: 'application/json' }

  @Sanity1 @tc0013 @UW
  Scenario Outline: Filtering vendor list
    Given path '/technical/vendor-list'
    And request {"application_id":"#(APP_ID)","property_id":1,"activity_code":"TECHNICAL_1"}
    When method POST    
    Then status 200
    And print 'Filtered lead response:', response
    And status <statuscode>
  
  Examples:
    | statuscode |
    | 200        |
