Feature: User fetch the favouring details
  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/PD/pd_owner_login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Priority: 'u=1, i', Referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site' }

  @Sanity1 @tc0010
  Scenario: fetching the favouring details
    Given path '/disbursement/favoring-details'
    And param role = 'MAKER'
    And request {"id":3,"favoring_type":"CUSTOMER","favoring_details":"VERNON PHILLIPS","mode_of_disbursement":"NEFT","instrument_number":"","ifsc_code":"UTIB0000004","bank_name":"AXIS BANK","account_number":"173010200000374","account_holder_name":"Dummy Customer Name","account_status":true,"passbook_or_cheque":null,"amount":"100000","maker_date":null,"checker_id":null,"checker_date":null,"remarks":"","favoringDetailsOptions":["VERNON PHILLIPS","CHHAYA PHILLIPS"],"isIfscVerified":true,"branch_name":"MUMBAI BRANCH","capri_disbursal_account":{"bank_partner_code":1437,"bank_name":"SBI CA a/c 37343784275","account_number":"84275","type":"CGHFL"},"application_id":'#(APP_ID)',"maker_action":"RECOMMENDED"}
    When method POST
    Then status 200
    And print 'Response:', response