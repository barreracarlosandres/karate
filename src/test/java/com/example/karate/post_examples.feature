Feature:

  Background:
    Given url 'https://reqres.in/api'

  Scenario: post to add user and validate response
    * def name = 'morpheus'
    * def job = 'leader'
    Given path '/users'
    And request
    """
    {
      "name": '#(name)',
      "job": '#(job)' }
    """
    When method Post
    Then status 201
    * print response
    And match response.name == name
    And match response.job == job
    And match response.id == '#string'
    And match response.createdAt contains '2023'

  Scenario Outline: post users one by one and validate each one
    Given path '/users'
    And request { "name": '<name>', "job": '<job>' }
    When method Post
    Then status 201
    And match response.name == '<name>'
    And match response.job == '<job>'
    And match response.id == '#string'
    And match response.createdAt contains '<year>'

    Examples:
      | name   | job       | year |
      | carlos | developer | 2023 |
      | juan   | engineer  | 2023 |

