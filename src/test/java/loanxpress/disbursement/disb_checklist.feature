Feature: Update Disbursement Checklist

  Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/PD/pd_owner_login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Priority: 'u=1, i', Referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Google Chrome";v="132", "Chromium";v="132", "Not_A Brand";v="24"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site' }


  @Sanity1 @tc0011
  Scenario: Update disbursement checklist
    Given path '/disbursement/checklist'
    And param role = 'MAKER'
    And request { "obj_id": "#(OBJ_ID)", "checklist_data": { "application_form-photograph": "Yes", "application_form-application_form": "Yes", "application_form-insurance_form": "Yes", "application_form-product_details": "Yes", "application_form-connector_dsa": "Yes", "application_form-non_bt_case": "Yes", "kyc-kyc_docs": "Yes", "osv-osv_check": "Yes", "verification_reports-external_reports": "Yes", "verification_reports-roc_search_reports": "Yes", "verification_reports-property_address_match": "Yes", "verification_reports-technical_report": "Yes", "verification_reports-legal_report": "Yes", "verification_reports-title_search_report": "Yes", "system_checks-credit_sanction": "Yes", "system_checks-commercial_approval": "Yes", "sanction_letter-sanction_letter": "Yes", "disbursal_request_form-disbursal_request_form": "Yes", "loan_agreement_kit-cheque_favoring": "Yes", "loan_agreement_kit-signed_printed_schedules": "Yes", "loan_agreement_kit-agreement_stamping": "Yes", "loan_agreement_kit-execution_date_in_range": "Yes", "loan_agreement_kit-sanction_letter_details_match": "Yes", "loan_agreement_kit-signed_continuity_letter": "Yes", "loan_agreement_kit-moe_stamped": "Yes", "loan_agreement_kit-signate_match": "Yes", "loan_agreement_kit-valid_dated_executed_document": "Yes", "loan_agreement_kit-correct_due_date": "Yes", "loan_agreement_kit-pdc_nach_check": "Yes", "loan_agreement_kit-emi_amount_match": "Yes", "loan_agreement_kit-payers_name": "Yes", "loan_agreement_kit-pdc_approval": "Yes", "loan_agreement_kit-mandate_signature": "Yes", "loan_agreement_kit-pdc_rubber_stamped": "Yes", "loan_agreement_kit-valid_nach": "Yes", "loan_agreement_kit-lod_modt_collection": "Yes", "loan_agreement_kit-bt_collection": "Yes", "repayment_document-pdc_nach": "Yes", "otc_pdd-document_updated_legal_report": "Yes", "documents-otc_approval": "Yes", "documents-cersai_search_report": "Yes", "documents-file_docket_screened_stamped": "OTC", "documents-sampled_report_check": "Yes", "rcu_check-hunter_check": "Yes", "fee_charges-charge_verification": "Yes", "sanction_condition_compliance-compiled_sanction_condition": "Yes", "repayment_schedule-repayment_schedule": "Yes", "other_documents-company_director": "Yes", "other_documents-board_resolution": "Yes", "other_documents-partnership_authority_letter": "Yes", "other_documents-section_180_compliance": "Yes", "other_documents-vernacular_undertaking": "Yes", "other_documents-end_user_letter": "Yes", "other_documents-loan_fore_closure_letter": "Yes", "other_documents-own_contribution_receipt": "Yes" } }
    When method PUT
    Then status 200
    And print 'Response:', response
