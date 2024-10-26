Feature: User raises a query
  
  Background:
    * url BASE_URL1
    * print 'Executing Login to Fetch Token'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token

    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

    # Fetch lead details and extract application_id
    * print 'Fetching Lead Details'
    * def result1 = call read('classpath:loanxpress/apis_1/lead_detail.feature')
    * def varcomment = result1.response.dt.application_id
    * print 'Extracted Application ID (varcomment):', varcomment

    # Check that varcomment is not null
    * assert varcomment != null  // Ensures varcomment is correctly set

   @ignore @Sanity1 @tc0006
  Scenario Outline: Raising the query
    Given path '/proxy/comm/' + varcomment + '/comment'
    And request { "threadId": "#(varcomment)", "text": "raise a query", "sectionName": "loan-details", "depth": 0, "parentId": null, "fileName": null, "mainId": null }
    When method POST
    Then status <statuscode>

  Examples:
    | statuscode |
    | 200        |
