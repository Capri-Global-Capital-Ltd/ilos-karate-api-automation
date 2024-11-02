Feature: User edits the lead details

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def search_customer2 = call read('classpath:loanxpress/UW/dedupe_submit_lead.feature')
    * def token = result.response.dt.token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }


@Sanity1 @tc0023 @UW1
  Scenario: Viewing lead detail
    Given path '/assignee/lead/' + OBJ_ID
    When method GET
    Then status 200
    And print response
    And print 'Response application_id:', response.dt.application_id
   
  @Sanity1 @tc0022 @UW1
  Scenario: Submit dedupe lead - Step 2
    Given path '/underwriter/lead/dedupe-submit/' + OBJ_ID
    And request {"dpd":0}
    When method POST
    Then status 200
    
    
    @Sanity1 @tc0024 @UW1
  Scenario: Viewing lead detail
    Given path '/assignee/lead/' + OBJ_ID
    When method GET
    Then status 200
    And print response
    And print 'Response application_id2:', response.dt.application_id
    
      @Sanity1 @tc0025 @UW1
  Scenario: Submit dedupe lead - Step 2
    Given path '/underwriter/lead/dedupe-submit/' + OBJ_ID
    And request {"dpd":0}
    When method POST
    Then status 200