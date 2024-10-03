Feature: Update a brand

  Background: 
    * url BASE_URL
    *  print 'print 1'
    * def result = call read('classpath:loanxpress/apis/login_brands.feature')
    * def JwtToken = result.response.token
    * configure headers = {Authorization: '#("Bearer "+JwtToken)',Content-Type:'application/json'}


 @Sanity @tc01112
   Scenario: Updating brand

     * def requestBody = read(TEST_DATA1 + 'requests/update_brands_req.json')
     #   | read( TEST_DATA + '/tc001/update_brands_req.json') |
     Given path 'users/2'
     And request requestBody
     When method PUT
     Then status 200
     Then print 'Print JwtToken', JwtToken
     Then print 'Print @tc020 response', response
     And match $.job contains 'resident'
     And match response.updatedAt == '#notnull'
     



