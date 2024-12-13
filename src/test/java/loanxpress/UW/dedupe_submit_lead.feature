Feature: User submit the lead from Dedupe module

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

    
      @Sanity1 @tc0021 @UW3
  Scenario: Submit dedupe lead - Step 1
    Given path '/underwriter/lead/dedupe-submit/' + OBJ_ID
    And request {"dpd":0}
    When method POST
    Then status 200
    
    @Sanity1 @tc0023 @UW3
  Scenario: Viewing lead detail
    Given path '/assignee/lead/' + OBJ_ID
    When method GET
    Then status 200
    And print response
    And print 'Response application_id:', response.dt.application_id
   
   
         @Sanity1 @tc0022 @UW3
  Scenario: Submit dedupe lead - Step 1
    Given path '/underwriter/lead/dedupe-submit/' + OBJ_ID
    And request {"dpd":0}
    When method POST
    Then status 400
    * def expectedResponse = read(TEST_DATA1 + 'responses/dedupe_submit_res.json')
    And match response == expectedResponse
    