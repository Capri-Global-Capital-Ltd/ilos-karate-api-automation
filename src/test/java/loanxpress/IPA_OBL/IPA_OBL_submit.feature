Feature: User fetches the lead details and initiate novel

  Background:
    * url BASE_URL1
    * print 'Initializing login and setting up headers'
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }
    * print 'Token retrieved:', token
    
    * def IPA_leaddetail = call read('classpath:loanxpress/IPA_OBL/IPA_lead_detail.feature')
    * def account_number2 = IPA_leaddetail.response.dt.applicant.primary.bank_acc_details[0].account_number
    * def statement = IPA_leaddetail.response.dt.applicant.primary.bank_acc_details[0].statement
    
    
    

  @Sanity1 @tc0016
  Scenario: Initiating IPA lead with document upload
    Given path '/ipa/lead/initiate-novel/' + OBJ_ID
    And request {"is_prm_app": true, "coapp_id": null, "app_id": "#(APP_ID)", "acc_no": "#(account_number2)", "dsn": "BANK DOCUMENTS=LATEST 6 MONTHS SAVINGS ACCOUNT BANK STATEMENT", "stmt": "#(statement)", "fn": "BANK OF BARODA (999999255)"}
    When method PATCH
    Then status 200
    
    
  @Sanity1 @tc0017
  Scenario: Submit IPA lead
    Given path '/ipa/lead/submit/' + OBJ_ID
    When method PATCH
    Then status 200
    
    
  @Sanity1 @tc0018
  Scenario: Submit Obligations lead
    Given path '/obligation/lead/submit/' + OBJ_ID
    And request {"is_prm_app":true,"roi":"16.00","rt":"SEMI-FIXED"}
    When method PATCH
    Then status 200
    