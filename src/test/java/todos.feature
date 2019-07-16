Feature: Test CRUD on Todos rest API

  Scenario: Verify list of all to-dos is returned successfully and contains 200 todos
    Given url 'https://jsonplaceholder.typicode.com/todos'
    When method GET
    Then status 200
    And assert response.length == 200


  Scenario: Verify a to-do is returned successfully
    Given url 'https://jsonplaceholder.typicode.com/todos/25'
    When method GET
    Then status 200
    And match response.id == '25'

  Scenario: Verify a new to-do is added successfully
    * def payload1 =
    """
    {
	"userId": 11,
	"id": 201,
	"title": "suscipit repellat esse quibusdam voluptatem incidunt",
	"completed": true
    }
    """
    Given url 'https://jsonplaceholder.typicode.com/todos'
    And request payload1
    When method POST
    Then status 201

  Scenario: Verify a to-do is updated successfully
    * def payload2 =
    """
    {
	"userId": 1,
	"id": 20,
	"title": "ullam nobis libero sapiente ad optio sint",
	"completed": false
    }
    """
    Given url 'https://jsonplaceholder.typicode.com/todos/20'
    And request payload2
    When method PUT
    Then status 200

  Scenario: Verify a to-do is deleted successfully
    Given url 'https://jsonplaceholder.typicode.com/todos/25'
    When method DELETE
    Then status 200

