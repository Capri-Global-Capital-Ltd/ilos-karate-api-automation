Feature: Lead Management - Section Completion and Submission

  Background:
    * url BASE_URL1
    * print 'Executing login to fetch authorization token'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Retrieved Token:', token
    * def result1 = call read('classpath:loanxpress/apis_1/pending_listing.feature')
    * def ObjectId = result1.response.dt[0]._id  
    * print 'Extracted Lead ID:', ObjectId
  
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc0007
  Scenario Outline: Mark section as complete for a lead
    Given path '/assignee/lead/mark-section-complete/' + ObjectId
    And request { "section": "<section>" }
    When method PATCH
    Then status <statuscode>
    And print 'Response:', response

  Examples:
    | section        | statuscode |
    | loan-details   | 200        |
    | guarantor      | 200        |
    | document       | 200        |
    | property       | 200        |
    | references     | 200        |
    
  @Sanity1 @tc0008
  Scenario: Submit lead
    Given path '/assignee/lead/submit-lead/' + ObjectId
    When method PATCH
    Then status 200
    And print 'Lead Submission Response:', response
