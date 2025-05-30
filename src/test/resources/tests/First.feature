Feature: Sample API Tests

  #  Scenario: Sample GET request for a single user
  #    Given url "https://reqres.in/api/users/2"
  #    When method GET
  #    Then status 200
  #    * print response
  #    And match response.data ==
  #      """
  #      {
  #        "id": 2,
  #        "email": "janet.weaver@reqres.in",
  #        "first_name": "Janet",
  #        "last_name": "Weaver",
  #        "avatar": "https://reqres.in/img/faces/2-image.jpg"
  #      }
  #      """


  Scenario: Sample GET request for all users
    Given url "https://reqres.in/api/users?page=2"
    When method GET
    * print "Validation Started"
    * def expectedSchema =
      """
    {
      page: '#number',
      per_page: '#number',
      total: '#number',
      total_pages: '#number',
      data: '#[]',
      support: {
        url: '#string',
        text: '#string'
      }
    }
    """
    Then status 200
        * print response
        * def expectedResponse = read('classpath:testdata/userspage2.json')
        And match response == expectedResponse
    And match response == expectedSchema
      And match response.data[0] ==
        """
        {
          "id": 7,
          "email": "michael.lawson@reqres.in",
          "first_name": "Michael",
          "last_name": "Lawson",
          "avatar": "https://reqres.in/img/faces/7-image.jpg"
        }
        """
      * match each response.data == {id: '#number',email: '#string',first_name: '#string',last_name: '#string',avatar: '#string'}
      * match each response.data ==
        """
        {
          id: '#number',
          email: '#string',
          first_name: '#string',
          last_name: '#string',
          avatar: '#string'
        }
        """
      And match response.data[0].email == "michael.lawson@reqres.in"
      And match response.data[0].first_name == 'Michael'
      And match response.data[0].last_name == 'Lawson'
      And match each response.data[*].id != null
      And match response.data[*].email == '#notnull'
      * def commonUtils = Java.type('CommonUtils')
      * eval commonUtils.print()
      * def a = 4
      * def b = 5
      * assert a + b == 9
      * print 'This is the value of a: ' + a + ' and This is the value of b: ' + b
      * def c = commonUtils.add(a, b)
      * print 'This is the value of a + b = c : ' + c
      * print 'Validation Ended'