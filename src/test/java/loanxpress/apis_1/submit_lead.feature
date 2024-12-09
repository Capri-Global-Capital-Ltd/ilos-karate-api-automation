Feature: User edits the lead details

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc0008
  Scenario: Submit lead
    Given path '/assignee/lead/submit-lead/' + OBJ_ID
    When method PATCH
    Then status 200
    And print 'Lead Submission Response:', response
    * def leadId = response['id '] // Capture response ID into a variable
    And print 'Lead Submission Response2:', leadId

