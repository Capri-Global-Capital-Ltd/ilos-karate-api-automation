Feature: User login in a website
  Background:
    * url BASE_URL
    * print 'print 2'
   
     @Sanity1 @tc0001
    Scenario Outline: Login successful
    Given path '/login'
    And request {"app":"XLX","user":"JCH_Test@capriglobal.in","pswd":"Capri@123","l_t":"capri_user"}
    When method POST	
    Then status <statuscode>
    Then print 'Print @tc028 part1', response.dt.token

    
  Examples: 
   | statuscode | 
   | 200        | 