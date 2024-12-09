Feature: User edits the lead details

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc00011 @UW
  Scenario: Submit UW lead - Step 2
    Given path '/application/generate-pdf/' + APP_ID
    When method GET
    Then status 200
    * print 'Status code is:', responseStatus  