#zsm
Feature: User save the commercial lead
 Background:
    * url BASE_URL1
    * def result = call read('classpath:loanxpress/commercial_approval/ZSM_login.feature')
    * def token = result.response.dt.token
    * print 'Token:', token
    * configure headers = { Authorization: '#(token)', Accept: 'application/json, text/plain, */*', 'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8', 'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', Origin: 'https://ilos-uat.capriglobal.in', Priority: 'u=1, i', Referer: 'https://ilos-uat.capriglobal.in/', 'sec-ch-ua': '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"', 'sec-ch-ua-mobile': '?0', 'sec-ch-ua-platform': '"Linux"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site' }


     @Sanity1 @tc0001
    Scenario Outline: User save the commercial lead
    Given path '/le/hfl/'+ OBJ_ID
    And request {"m_rp":null,"r_fq":"Monthly","la":1180746,"roi":"14","tr":"216","is_dsra":false,"fc_tp":["RESIDENTIAL"],"pd_tp":"home loan semi fixed","pr":[{"id":1,"ltv":4.72,"la":1180746,"p_la":null,"pv":null,"i_ltv":null,"o_ltv":null,"tp_ltv":null,"bt_ltv":null,"tp_la":null,"bt_la":null}],"bt_los":null,"bt_lt":null,"tp_nm":null,"bk_nm":null}
    When method POST	
    Then status <statuscode>

    
  Examples: 
   | statuscode | 
   | 200        | 