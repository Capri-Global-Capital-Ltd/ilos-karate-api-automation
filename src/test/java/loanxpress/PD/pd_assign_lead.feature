Feature: User self assign the lead from pd module

  Background:
    * url BASE_URL_PD
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc0008
  Scenario: Submit lead
    Given path '/application/assign'
    And request { appId: '#(APP_ID)' }
    When method POST
    Then status 200
    And print 'Lead Submission Response:', response