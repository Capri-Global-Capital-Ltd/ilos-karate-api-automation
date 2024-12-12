@ignore
Feature: User fetches the lead details and uploads bank statements

  Background:
    * url BASE_URL1
    * print 'Initializing login and setting up headers'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }
    * print 'Token retrieved:', token

  @Sanity1 @tc0013
  Scenario: Viewing IPA lead detail
    Given path '/assignee/lead/' + OBJ_ID
    When method GET
    Then status 200
    * def account_number2 = response.dt.applicant.primary.bank_acc_details[0].account_number
    * print 'Account Number:', account_number2
    * def account_number2 = response.dt.applicant.primary.bank_acc_details[0].statement
    * print 'statement Number:', account_number2

   
   
   