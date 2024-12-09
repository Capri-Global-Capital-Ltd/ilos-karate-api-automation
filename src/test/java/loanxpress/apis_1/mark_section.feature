Feature: Lead Management - Section Completion and Submission

  Background:
    * url BASE_URL1
    * print 'Executing login to fetch authorization token'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Retrieved Token:', token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc0007
  Scenario Outline: Mark section as complete for a lead
    Given path '/assignee/lead/mark-section-complete/' + OBJ_ID
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
    