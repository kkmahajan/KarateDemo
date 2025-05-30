Feature: Sample API Tests

#  Background:
#    * def response =
#    """
#
#    """

  Scenario: Sample GET request
    Given url "https://reqres.in/api/users/2"
    When method GET
    Then status 200
    * print response
#    And match response.data[0] ==
#    """
#
#    """