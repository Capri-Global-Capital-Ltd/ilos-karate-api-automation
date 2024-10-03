function() {

    karate.configure('connectTimeout', 50000);
    karate.configure('readTimeout', 50000);
    karate.configure('logPrettyResponse', true);

    var env = karate.env; // environment variable

    if (env == 'stg') {
        BASE_URL = 'https://ilosapi-uat.capriglobal.in/ilosuser/v1';
        BASE_URL1 = 'https://ilosapi-uat.capriglobal.in/ilos/v1';
        TEST_DATA = 'file:src/test/resources/stg/';
		TEST_DATA1 = 'file:src/test/resources/';
    } else if (env == 'dev') {
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
        BASE_URL: BASE_URL,
		BASE_URL1: BASE_URL1
    };

    karate.log('karate.env system property is: ', env);
    karate.log('BASE_URL = ', BASE_URL);

    return config;
}
