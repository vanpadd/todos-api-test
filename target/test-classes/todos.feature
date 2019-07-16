Feature: Test CRUD on Todos rest API

  Scenario: Verify list of all to-dos is returned successfully and contains 200 todos
    Given url 'https://jsonplaceholder.typicode.com/todos'
    When method get
    Then status 200
    And assert response.length == 200

  Scenario: Verify list of all to-dos is returned successfully and contains 200 todos
    * def payload1 =
    """
    { "title": "foo", "body": "bar", "id": 203 }
    """
    Given url 'https://jsonplaceholder.typicode.com/todos'
    And request payload1
    When method POST
    Then status 201
