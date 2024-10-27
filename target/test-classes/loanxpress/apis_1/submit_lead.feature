Feature: User edits the lead details

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * def result1 = call read('classpath:loanxpress/apis_1/mark_section_SUBMIT.feature')
    * def ObjectId = result1.response.dt._id  // Extracting application_id from mark_section_SUBMIT.feature
    * print 'Extracted application_id:', ObjectId
    * def application_id = result1.response.dt.application_id  // Extracting application_id from mark_section_SUBMIT.feature
    * print 'Extracted application_id:', application_id
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc0008
  Scenario: Submit lead
    Given path '/assignee/lead/submit-lead/' + ObjectId
    When method PATCH
    Then status 200
    And print 'Lead Submission Response:', response
    * def leadId = response['id '] // Capture response ID into a variable
    And print 'Lead Submission Response2:', leadId

