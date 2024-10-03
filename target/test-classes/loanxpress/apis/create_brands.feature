Feature: Create a brand
Background: 
* url BASE_URL
* def randomString = "Morphus "+Java.type('utils.JavaUtil').generateRandomString(5)

@Sanity @tc01111
Scenario: Creating brand
  Given path '/users'
    And request { "name": "#(randomString)","job": "leader" }
   When method POST	
   Then status 201
   Then print 'Print @tc020 part1', randomString
   Then print 'Print @tc020 response', response

@Sanity @tc02831
Scenario Outline: Creating new brand
  Given path '/users'
    And request { "name": "<name>","job": "leader" }
   When method POST	
   Then status <statuscode>
    And print "Beautified response of API is......", response
#    * def expectedResponse = read(RESPONSE + '<responseFile>')
    * def expectedResponse = read(TEST_DATA1 + 'responses/create_brands_res.json')
    And match response == expectedResponse

  Examples: 
    | name   | statuscode | 
    | Ashish | 201        | 


