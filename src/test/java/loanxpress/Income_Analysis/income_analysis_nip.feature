Feature: Assigning the vendor from vendor list

  Background:
    * url BASE_URL1
    * print 'Initializing test setup'
    * def loginResponse = call read('classpath:loanxpress/apis_1/login.feature')
    * def authToken = loginResponse.response.dt.token
    * print 'Authentication Token:', authToken
    * configure headers = { Authorization: '#(authToken)', Content-Type: 'application/json' }

  @Sanity1 @tc0013 @UW
  Scenario Outline: Assigning the vendor
    Given path '/income-program/nip/' + OBJ_ID
    And request {"applicant_type":"primary","applicant_id":921466,"income_program":"nip","income_program_details":{"nip":{"nip_calculation":{"1":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"2":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"3":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"4":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"5":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"6":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"7":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"8":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"9":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"10":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"11":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"12":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"13":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"14":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"15":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"16":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"17":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"18":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"19":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"20":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"21":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"22":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"23":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"24":{"8/2024":30000,"9/2024":30000,"10/2024":30000,"average":30000},"25":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"26":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"27":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"28":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"29":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"30":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"31":{"8/2024":0,"9/2024":0,"10/2024":0,"average":0},"32":{"8/2024":30000,"9/2024":30000,"10/2024":30000,"average":30000}},"core_business":{"sales_receipts":30000,"expenses":{"purchases":0,"electricity_expense":0,"salary":0,"rent":0,"telephone_bill":0,"water_expenses":0,"municipal_tax":0,"finance_cost":0,"conveyance":0,"marketing_expense":0,"stationary_expense":0,"others":0},"total_expense":0,"net_profit":30000},"other_incomes":{"pension_income":{"monthly_income":0,"eligible_income":0,"percentage_to_be_considered":0},"rental_income":[{"property_address":"","property_owner":"","monthly_rent":0,"eligible_income":0,"mode_of_payment":"BANK"}],"agricultural_income":{"current_year":0,"previous_year":0,"eligible_income":0,"current_fiscal_year":"2023 - 2024","previous_fiscal_year":"2022 - 2023"},"interest_and_dividend_income":{"current_year":0,"previous_year":0,"eligible_income":0,"current_fiscal_year":"2023 - 2024","previous_fiscal_year":"2022 - 2023"},"secondary_business_income":[],"other_income_total":0},"total_monthly_eligible_income":30000}}}
    When method POST      
    Then status 200
    And print 'Filtered lead response:', response
    And status <statuscode>
  
  Examples:
    | statuscode |
    | 200        |
