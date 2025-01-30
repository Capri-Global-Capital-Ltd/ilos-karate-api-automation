function() {

  karate.configure('connectTimeout', 50000);
  karate.configure('readTimeout', 50000);
  karate.configure('logPrettyResponse', true);
  
  var env = karate.env; // environment variable
  
  if (env == 'stg') {
  BASE_URL = 'https://ilosapi-uat.capriglobal.in/ilosuser/v1';
  BASE_URL_PD = 'https://ilosapi-uat.capriglobal.in/pd';
  BASE_URL1 = 'https://ilosapi-uat.capriglobal.in/ilos/v1';
  BASE_URL2 = 'https://ilosapi-uat.capriglobal.in/ilos/v2';
  BASE_URL_TEC_REP = 'http://capri-core-nlb-pvt-d60aaf691e8006d3.elb.ap-south-1.amazonaws.com:8285';
  TEST_DATA = 'file:src/test/resources/stg/';
  TEST_DATA1 = 'file:src/test/resources/';
  TEST_DATA1 = 'file:src/test/resources/';
  OBJ_ID='67889d152bca34c5fdcc15e5';
  APP_ID='91103_13';
  APP_ID1 = APP_ID+"_1";
  }
  else if (env == 'prod') {
  
  BASE_URL = 'https://loanxpress-api.caprihomeloans.com/ilosuser/v1';
  BASE_URL1 = 'https://ilosapi-uat.capriglobal.in/ilos/v1';
  BASE_URL2 = 'https://ilosapi-uat.capriglobal.in/ilos/v2';
  TEST_DATA = 'file:src/test/resources/stg/';
  TEST_DATA1 = 'file:src/test/resources/';
  TEST_DATA1 = 'file:src/test/resources/';
  OBJ_ID='672f056499cbe99929d8eba0';
  APP_ID='911039_56';
  
  }
  else if (env == 'dev') {
  BASE_URL = 'https://reqres.in/api';
  BASE_URL1 = 'https://bre-dev.capriglobal.in';
  } else {
  // Default or error case
  BASE_URL = 'https://reqres.in/api';
  BASE_URL1 = 'https://bre-dev.capriglobal.in';
  }
  
  var config = {
  REQUEST: 'classpath:src/test/resources/requests/',
  RESPONSE: 'classpath:src/test/resources/responses/',
  OBJ_ID: OBJ_ID,
  APP_ID: APP_ID,
  BASE_URL: BASE_URL,
  BASE_URL1: BASE_URL1,
  BASE_URL2: BASE_URL2,
  BASE_URL_PD: BASE_URL_PD,
  BASE_URL_TEC_REP: BASE_URL_TEC_REP,
  APP_ID1: APP_ID1
  };
  
  karate.log('karate.env system property is: ', env);
  karate.log('BASE_URL = ', BASE_URL);
  
 
  karate.configure('afterScenario', function() {
      if (karate.responseTime) {
        karate.log('Time taken for last API call:', karate.responseTime, 'ms');
        karate.embed({ "API Response Time (ms)": karate.responseTime }, 'application/json');
      }
    });

  return config;
  }
  
  