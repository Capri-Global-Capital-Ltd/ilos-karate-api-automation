Feature: User add repayment bank
  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/PD/pd_owner_login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token


    * def uid_var = call read('classpath:loanxpress/disbursement/disb_repayment_bank_acc.feature')
    * def uid1 = uid_var.response.data[0].uid
    * print 'Token:', uid1

    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Priority: 'u=1, i', Referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site' }

  @Sanity1 @tc0010
  Scenario: adding repayment bank
    Given path '/repayment/bank-accounts/' + OBJ_ID
    And request {"applicant_id":921466,"applicant_name":"VERNON PHILLIPS","bank_account":{"bank_name":"BANK OF BARODA","ifsc_code":"BARB0LDALUC","branch_name":"LDA COLONY,LUCKNOW","account_number":"999999255","account_holder_name":"Vernon Albert Phillips","account_type":"Savings","account_since":"","default_repayment":true,"uid":'#(uid1)'}}
    When method PATCH
    Then status 200
    And print 'Response:', response