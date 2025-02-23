Feature: Repayment Bank Account Details

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * configure headers = { Authorization: '#(token)', accept: 'application/json' }

  @Sanity1 @tc0005
  Scenario: Fetch repayment bank account details
    Given path '/repayment/bank-accounts/' + OBJ_ID
    When method GET
    Then status 200
    * print 'Response:', response
    * def uid = response.data[0].uid
    * print 'Extracted UID:', uid