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

