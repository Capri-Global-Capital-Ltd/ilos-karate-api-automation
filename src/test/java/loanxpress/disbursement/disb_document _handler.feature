Feature: S3 Document Upload Automation

  Background:
    * url BASE_URL2
     * def result = call read('classpath:loanxpress/PD/pd_owner_login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Priority: 'u=1, i', Referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site' }


  @uploadDocument @Sanity1
  Scenario: Upload document with specified headers and body
      Given path '/document-handler/' + OBJ_ID
    * def requestBody = { section: 'axis-bank-file_2.pdf', sub_section: 'esign', url: 'cgcl-ilos-uat-ui/upload_docs/user/911039_110_axis-bank-file_2.pdf_1738228438469.pdf', doc_type: 'OTHERS', doc_sub_type: 'ADDITIONAL-DOCUMENT', applicant_id: 921466, applicant_type: 'primary', doc_type_identifier: 'disbursement_esign', unique_id: null, docindex: 'undefined' }
    * request body = requestBody
    * method post
    * print response
      Then status 200

    