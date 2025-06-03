Feature: Reqres Sample API Tests
  Background:
    * url baseUrl
    * def userData =
      """
      {
        "id": 7,
        "email": "michael.lawson@reqres.in",
        "first_name": "Michael",
        "last_name": "Lawson",
        "avatar": "https://reqres.in/img/faces/7-image.jpg"
      }
    """

    Scenario: GET request for a single user
      Given path usersEndpoint
      And param page = 2
      When method GET
      Then status 200
      And match response.data[0] == userData
      And match each response.data == {id : '#number',email: '#string',first_name: '#string',last_name: '#string',avatar: '#string'}
      And match response.data[0].avatar == '#notnull'
      * match each response.data[*].id != null
#
    Scenario: POST create a new user with request body direct
      Given path usersEndpoint
      And header x-api-key = 'reqres-free-v1'
      And request {name: 'John Doe', job: 'Software Engineer'}
      When method POST
      Then status 201
      And match response.name == 'John Doe'
      And match response.job == 'Software Engineer'
      And match response.id == '#string'
      And match response.createdAt == '#string'

    Scenario: POST create a new user with request body file
      Given path usersEndpoint
      And header x-api-key = 'reqres-free-v1'
      And request read('classpath:testdata/CreateNewUser.json')
      When method POST
      Then status 201
      And match response.name == 'John Doe'
      And match response.job == 'Software Engineer'
      And match response.id == '#string'
      And match response.createdAt == '#string'

  Scenario: POST create a new user with request body with variables
    * def name = 'John Doe'
    * def job = 'Software Engineer'
    * def requestBody = {name: #(name), job: #(job)}

    Given path usersEndpoint
    And header x-api-key = 'reqres-free-v1'
    And request read('classpath:testdata/CreateNewUser.json')
    And print 'Request Body is: ' , requestBody
    When method POST
    Then status 201
    And print 'Response is: ' , response
    And match response.name == name
    And match response.job == job

  Scenario: PUT update an existing user
    Given path usersEndpoint, 2
    And header x-api-key = 'reqres-free-v1'
    And request {name: 'Jane Doe', job: 'Project Manager'}
    When method PUT
    Then status 200
    And match response.name == 'Jane Doe'
    And match response.job == 'Project Manager'

  Scenario: PATCH update an existing user
    Given path usersEndpoint, 2
    And header x-api-key = 'reqres-free-v1'
    And request {name: 'Jane Doe', job: 'Project Manager'}
    When method PATCH
    Then status 200
    And match response.name == 'Jane Doe'
    And match response.job == 'Project Manager'

  Scenario: DELETE an existing user
    Given path usersEndpoint, 2
    And header x-api-key = 'reqres-free-v1'
    When method DELETE
    Then status 204

  Scenario: GET a single user with id 7
    Given path usersEndpoint, 7
    And header x-api-key = 'reqres-free-v1'
    When method GET
    Then status 200
    And match response.data == userData