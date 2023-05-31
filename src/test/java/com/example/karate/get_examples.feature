Feature:

  Background:
    * def random = Java.type('com.example.karate.Generator')
    * def varPage = parseInt(random.getRandomNumber())
    Given url 'https://reqres.in/api'

  Scenario: get all users and validate the json structure
    Given param page = varPage
    Given path '/users'
    When method Get
    Then status 200
    And match response.page == varPage
    * print response
#    And match each response.data[*] == {'id': '#number', 'email': '#string', 'first_name': '#string', 'last_name': '#string', 'avatar': '#string'}
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

  Scenario: get all users and validate the structure with json file
    Given param page = varPage
    Given path '/users'
    When method Get
    Then status 200
    And match response.page == varPage
    And match each response.data[*] == read('templates/user_structure.json')

  Scenario: get with parameter and validate user id and name
    * def idUser = 1
    Given path '/users', idUser
    When method Get
    Then status 200
    And match response.data.id == idUser
    And match response.data.first_name == 'George'
