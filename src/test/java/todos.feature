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
    * def newTodo = read('classpath:data/newTodo.json')
    Given url 'https://jsonplaceholder.typicode.com/todos'
    And request newTodo
    When method POST
    Then status 201

  Scenario: Verify a to-do is updated successfully
    * def updateTodo = read('classpath:data/updateTodo.json')
    Given url 'https://jsonplaceholder.typicode.com/todos/20'
    And request updateTodo
    When method PUT
    Then status 200

  Scenario: Verify a to-do is deleted successfully
    Given url 'https://jsonplaceholder.typicode.com/todos/25'
    When method DELETE
    Then status 200

