Feature: User aprove the deviation

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/Credit_Sanction/cs_jch_login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Priority: 'u=1, i', Referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site' }

  @Sanity1 @tc0010
  Scenario: Verifying the config of LE module
    Given path '/misc/update-deviation'
    And param module = 'loan_eligibility'
    And request {"application_id": '#(APP_ID)',"condition": "Application with more than 2 HL/Mortgage enquires in last 3 months#applicant_id_921466","remarks": "ok","status": "APPROVED","is_deleted": false,"mitigants": "ok"}
    When method PATCH
    Then status 200
    And print 'Response:', response


    @Sanity1 @tc0010
  Scenario: Verifying the config of LE module
    Given path '/misc/update-deviation'
    And param module = 'loan_eligibility'
    And request {"application_id": '#(APP_ID)',"condition": "Resi Cum office Loan amount up to 25 lacs","remarks": "ok","status": "APPROVED","is_deleted": false,"mitigants": "ok"}
    When method PATCH
    Then status 200
    And print 'Response:', response