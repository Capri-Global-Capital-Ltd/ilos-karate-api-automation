Feature: Login in a website
  Background:
    * url BASE_URL
    * print 'print 2'
   
     @Sanity @tc0221
    Scenario Outline: Login successful
    Given path '/login'
    And request {"email": "eve.holt@reqres.in",   "password": "cityslicka" }
    When method POST	
    Then status <statuscode>
    #And match $.message contains '<message>'
    Then print 'Print @tc028 part1', response

    
    Examples:
 #      | read( TEST_DATA + '/tc001/data.csv') |
      | read('login_data.csv') |