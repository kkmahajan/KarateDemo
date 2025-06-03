function fn(){
    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);

    var config = {
        baseUrl: 'https://reqres.in/api',
        usersEndpoint: '/users'
    };
    return config;
}