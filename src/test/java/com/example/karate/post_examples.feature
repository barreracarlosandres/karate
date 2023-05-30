Feature:

  Background:
    * def varPage = 1
    Given url 'https://reqres.in/api'

  Scenario: test-add-user-and-validate
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
    And match response.name == name
    And match response.job == job
    And match response.id == '#string'
    And match response.createdAt contains '2023'

  Scenario Outline: test-add-user-and-validate-with-examples
    Given path '/users'
    And request
    """
    {
      "name": '<name>',
      "job": '<job>' }
    """
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

