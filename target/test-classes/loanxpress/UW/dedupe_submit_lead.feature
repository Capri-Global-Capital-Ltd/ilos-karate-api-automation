@ignore
Feature: User edits the lead details

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def search_customer2 = call read('classpath:loanxpress/UW/search_customer2.feature')
    * def token = result.response.dt.token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

    
      @Sanity1 @tc0021 @UW1
  Scenario: Submit dedupe lead - Step 1
    Given path '/underwriter/lead/dedupe-submit/' + OBJ_ID
    And request {"dpd":0}
    When method POST
    Then status 200