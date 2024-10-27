Feature: User filters and assigns a lead from UW

  Background:
  
      * url BASE_URL1
    * def result = call read('classpath:loanxpress/apis_1/login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * def result1 = call read('classpath:loanxpress/apis_1/lead_detail2.feature')
    * def obj_id = result1.lastId
    * def application_id = result1.lastap_no
    * print 'Extracted application_id:', application_id
    * print 'Extracted object_id:', obj_id
    * configure headers = { Authorization: '#(token)', Content-Type: 'application/json' }

    
 @Sanity1 @tc00131
  Scenario: Self-assign lead
    And print 'Response ObjectId:', obj_id
    Given path '/underwriter/lead/self_assign/' + obj_id 
    When method PATCH
    Then status 200
    And print 'Self-assigned lead:', response
