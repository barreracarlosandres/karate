Feature:

  Background:
    * def varPage = 1
    Given url 'https://reqres.in/api'

  Scenario: test-add-user-and-validate
    Given path '/users'
    And request { "name": "morpheus", "job": "leader" }
    When method Post
    Then status 201
    And match response.name == 'morpheus'
    And match response.job == 'leader'
    And match response.id == '#string'
    And match response.createdAt contains '2023'

