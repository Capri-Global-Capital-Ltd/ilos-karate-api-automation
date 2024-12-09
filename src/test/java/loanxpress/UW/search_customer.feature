Feature: User fetch the lead details and create a customer

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token

    # Call the uw_lead_detail.feature to get lead details
    * def uw_leaddetail = call read('classpath:loanxpress/UW/dedupe_lead_detail.feature')
    * def app_customer_id = uw_leaddetail.response.dt.applicant.primary.id
    * def coapp_customer_id = uw_leaddetail.response.dt.applicant.co_applicant[0].id
    * def guar_customer_id = uw_leaddetail.response.dt.applicant.guarantors[0].id

    * print 'print 1 token:', token
    * print 'Applicant Customer ID:', app_customer_id
    * print 'Co-applicant Customer ID:', coapp_customer_id
    * print 'Guarantor Customer ID:', guar_customer_id

    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

  @Sanity1 @tc0014 @UW3
  Scenario: Viewing lead detail for Applicant
    Given path '/customer/posidex/search-customer'
    And request {"customer_type": "applicant", "application_id": "#(APP_ID)", "customer_id": "#(app_customer_id)"}
    When method POST    
    Then status 200
    Then print 'Response for applicant customer detail:', response

  @Sanity1 @tc0015 @UW3
  Scenario: Viewing lead detail for Co-applicant
    Given path '/customer/posidex/search-customer'
    And request {"customer_type": "co_applicant", "application_id": "#(APP_ID)", "customer_id": "#(coapp_customer_id)"}
    When method POST    
    Then status 200
    Then print 'Response for co-applicant customer detail:', response

  @Sanity1 @tc0016 @UW3
  Scenario: Viewing lead detail for Guarantor
    Given path '/customer/posidex/search-customer'
    And request {"customer_type": "guarantor", "application_id": "#(APP_ID)", "customer_id": "#(guar_customer_id)"}
    When method POST    
    Then status 200
    Then print 'Response for guarantor customer detail:', response

  @Sanity1 @tc0017 @CreateCustomer @UW3
  Scenario: Create a Guarantor Customer
    Given path '/customer/posidex/create-customer'
    And request {"customer_type": "guarantor", "application_id": "#(APP_ID)", "customer_id": "#(guar_customer_id)"}
    When method POST
    Then status 200
    Then print 'Response for create customer:', response
    
    
     @Sanity1 @tc0017 @CreateCustomer @UW3
  Scenario: mark section complete
    Given path '/assignee/lead/mark-section-complete/' + OBJ_ID
    And request {section: "dedupe-posidex"}
    When method PATCH
    Then status 200
    Then print 'Response for mark section complete:', response
    
      @Sanity1 @tc0018 @UW3
  Scenario: Viewing lead detail for Applicant
    Given path '/dedupe/search-customer'
    And request {"customer_type": "applicant", "application_id": "#(APP_ID)", "customer_id": "#(app_customer_id)"}
    When method POST    
    Then status 200
    Then print 'Response for applicant customer detail:', response

  @Sanity1 @tc0019 @UW3
  Scenario: Viewing lead detail for Guarantor
    Given path '/dedupe/search-customer'
    And request {"customer_type": "guarantor", "application_id": "#(APP_ID)", "customer_id": "#(guar_customer_id)"}
    When method POST    
    Then status 200
    Then print 'Response for guarantor customer detail:', response

  @Sanity1 @tc0020 @UW3
  Scenario: Viewing lead detail for Co-applicant
    Given path '/dedupe/search-customer'
    And request {"customer_type": "co_applicant", "application_id": "#(APP_ID)", "customer_id": "#(coapp_customer_id)"}
    When method POST    
    Then status 200
    Then print 'Response for co-applicant customer detail:', response
    

