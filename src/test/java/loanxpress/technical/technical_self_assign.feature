Feature: Filter leads on the technical home page

  Background:
    * url BASE_URL1
    * print 'Initializing test setup'
    * def loginResponse = call read('classpath:loanxpress/apis_1/login.feature')
    * def authToken = loginResponse.response.dt.token
    * print 'Authentication Token:', authToken
    * configure headers = { Authorization: '#(authToken)', Content-Type: 'application/json' }

  @Sanity1 @tc0013 @UW
  Scenario Outline: Filter and view a lead
    Given path '/technical/self-assign'
    And param role = "TC"
    And request { "application_id": "#(APP_ID)", "is_refer": false }
    When method POST    
    Then status 200
    And print 'Filtered lead response:', response
    And status <statuscode>
  
  Examples:
    | statuscode |
    | 200        |
