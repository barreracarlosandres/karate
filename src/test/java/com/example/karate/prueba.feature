Feature:

  Scenario: prueba 1
    Given url 'https://reqres.in/api/users?page=2'
    When method Get
    Then status 200