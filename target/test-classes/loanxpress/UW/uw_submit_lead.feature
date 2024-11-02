Feature: User edits the lead details

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def status = call read('classpath:loanxpress/UW/generate_uw_form.feature')
    * def token = result.response.dt.token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc00012 @UW @ignore
  Scenario: Submit UW lead - Step 2
    Given path '/underwriter/lead/submit/' + OBJ_ID
    When method PATCH
    Then status 200