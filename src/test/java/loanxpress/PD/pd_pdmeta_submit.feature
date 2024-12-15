Feature: User performs PD Meta Save request for multiple applicants with dynamic pdId mapping

  Background:
     * url BASE_URL_PD
    * def result = call read('classpath:loanxpress/PD/pd_owner_login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
  
  * def pd_metadata_list = call read('classpath:loanxpress/PD/pd_metadata_list.feature')
    * def pdid1 = pd_metadata_list.response.result[0].id
    * def pdid2 = pd_metadata_list.response.result[1].id
    * def pdid3 = pd_metadata_list.response.result[2].id

    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Priority: 'u=1, i', Referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site' }

  @Sanity1 @tc0020
  Scenario: Automate PD Meta Save Request for first applicant with dynamic pdId mapping and positive status
    Given path '/pdmeta/submit'
    And request {"pdId":"#(pdid1)","status":"POSITIVE","remark":""}
    When method POST    
    Then status 200
    Then print 'Response for first applicant customer detail:', response

  @Sanity1 @tc0020
  Scenario: Automate PD Meta Save Request for second applicant with dynamic pdId mapping and positive status
    Given path '/pdmeta/submit'
    And request {"pdId":"#(pdid2)","status":"POSITIVE","remark":""}
    When method POST    
    Then status 200
    Then print 'Response for second applicant customer detail:', response

  @Sanity1 @tc0020
  Scenario: Automate PD Meta Save Request for third applicant with dynamic pdId mapping and positive status
    Given path '/pdmeta/submit'
    And request {"pdId":"#(pdid3)","status":"POSITIVE","remark":""}
    When method POST    
    Then status 200
    Then print 'Response for third applicant customer detail:', response
