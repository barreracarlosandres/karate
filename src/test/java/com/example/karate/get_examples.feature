Feature:

  Background:
    * def varPage = 1
    Given url 'https://reqres.in/api'

  Scenario: test-all-users
    Given param page = varPage
    Given path '/users'
    When method Get
    Then status 200
    And match response.page == varPage
    And match each response.data[*] ==
    """
      {
        "id": "#number",
        "email": "#string",
        "first_name": "#string",
        "last_name": "#string",
        "avatar": "#string"
      }
    """

  Scenario: test-one-user
    * def idUser = 1
    Given path '/users',idUser
    When method Get
    Then status 200
    And match response.data.id == idUser
    And match response.data.first_name == 'George'
