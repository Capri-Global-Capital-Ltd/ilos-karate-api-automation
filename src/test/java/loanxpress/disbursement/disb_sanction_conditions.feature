Feature: Update Sanction Condition

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/PD/pd_owner_login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Priority: 'u=1, i', Referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Google Chrome";v="132", "Chromium";v="132", "Not_A Brand";v="24"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site' }


  @Sanity1 @tc0020
  Scenario: Update sanction condition
    Given path '/disbursement/sanction-condition'
    And param obj_id = OBJ_ID
    And request { "id": "e4c11abb-d513-48bb-918e-41bc1da89b9d", "received_status": "NO", "collection_stage": "OTC", "receipt_date": null, "doc_upload": "cgcl-ilos-uat-ui/upload_docs/user/911039_110_axis-bank-file_2.pdf_1738242072276.pdf", "application_id": '#(APP_ID)', "doc_type": "ORIGINAL", "doc_nature": "SCHOOL LEAVING CERTIFICATE", "sub_document_tag": "Revised / Corrected Insurance Form", "target_date": "2026-02-20" }
    When method PATCH
    Then status 200
    And print 'Response:', response
 