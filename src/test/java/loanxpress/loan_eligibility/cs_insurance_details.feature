Feature: User verifies the config of LE module

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/PD/pd_owner_login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Priority: 'u=1, i', Referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site' }

  @Sanity1 @tc0010
  Scenario: Verifying the config of LE module
    Given path '/credit-sanction/insurance-details/'+ OBJ_ID
    And request {"portfolio_type":"home loan semi fixed","product_code":"home loan","insurance_details":{"products":[{"applicant_id":921466,"insurance_type":"property","insurance_partner":"ICICI LOMBARD GIC LTD","applicant_name":"VERNON PHILLIPS","applicant_type":"primary","applicant_dob":"1972-12-10","premium":"10000","sum_assured":1180746,"percentage_penetration":null,"policy_tenure":216,"premium_reference_doc":"cgcl-ilos-uat-ui/upload_docs/user/911039_74_axis-bank-file_2.pdf_1734932654450.pdf","property_id":"1"},{"applicant_id":921472,"insurance_type":"life","insurance_partner":"ICICI PRUDENTIAL LIFE INSURANCE CO LTD","applicant_name":"CHHAYA PHILLIPS","applicant_type":"co_applicant","applicant_dob":"1973-12-01","premium":"10000","sum_assured":1180746,"percentage_penetration":null,"policy_tenure":216,"premium_reference_doc":"cgcl-ilos-uat-ui/upload_docs/user/911039_74_axis-bank-file_2.pdf_1734932750932.pdf"}]},"total_premium":"20000.00","total_sum_assured":"2361492.00","total_percentage_penetration":"1.69","mode_of_recovery":"Add to Loan Amount"}
    When method POST
    Then status 200
    And print 'Response:', response
