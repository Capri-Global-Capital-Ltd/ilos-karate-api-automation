Feature: User verifies the config of LE module

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/PD/pd_owner_login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Priority: 'u=1, i', Referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site' }

  @Sanity1 @tc0010
  Scenario: Verifying the config of LE module
    Given path '/credit-sanction/fees-and-charges/'+ OBJ_ID
    And request {"portfolio_type":"home loan semi fixed","product_code":"home loan","fees_and_charges":[{"type":"Processing Fee","amount":2000,"tax_amount":360,"final_amount":2360,"mode_of_recovery":"Deduct from disbursement","part_of_sanction_letter":true,"tax_in_percentage":18,"percentage":null},{"type":"RCU charges","amount":750,"tax_amount":135,"final_amount":885,"mode_of_recovery":"Deduct from disbursement","part_of_sanction_letter":true,"tax_in_percentage":18,"percentage":null},{"type":"Valuation charges","amount":2000,"tax_amount":360,"final_amount":2360,"mode_of_recovery":"Deduct from disbursement","part_of_sanction_letter":true,"tax_in_percentage":18,"percentage":null,"number_of_properties_considered":1,"original_charge":2000},{"type":"Document handling charges","amount":21013.06,"tax_amount":3782.35,"final_amount":24795.41,"mode_of_recovery":"Deduct from disbursement","part_of_sanction_letter":true,"tax_in_percentage":18,"percentage":1.75},{"type":"Legal charges","amount":3000,"tax_amount":540,"final_amount":3540,"mode_of_recovery":"Deduct from disbursement","part_of_sanction_letter":true,"tax_in_percentage":18,"percentage":null,"number_of_properties_considered":1,"original_charge":3000},{"type":"CERSAI charges","amount":100,"tax_amount":18,"final_amount":118,"mode_of_recovery":"Deduct from disbursement","part_of_sanction_letter":true,"tax_in_percentage":18,"percentage":null},{"type":"Difference of IMD","amount":3000,"tax_amount":540,"final_amount":3540,"mode_of_recovery":"Deduct from disbursement","part_of_sanction_letter":true,"tax_in_percentage":18}],"total_amount":31863.06,"total_tax_amount":5735.35,"final_amount":37598.41}
    When method POST
    Then status 200
    And print 'Response:', response
