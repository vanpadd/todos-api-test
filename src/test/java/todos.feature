Feature: Test CRUD on Todos rest API

  Scenario: Verify list of all to-dos is returned successfully and contains 200 todos
    Given url 'https://jsonplaceholder.typicode.com/todos'
    When method get
    Then status 200