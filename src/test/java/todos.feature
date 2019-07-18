Feature: Test CRUD on Todos rest API

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: Verify list of all to-dos is returned successfully and contains 200 todos
    Given path 'todos'
    When method GET
    Then status 200
    And assert response.length == 200

  Scenario: Verify a to-do is returned successfully
    Given path 'todos/25'
    When method GET
    Then status 200
    And match response.id == '25'

  Scenario Outline: Given a to-do, validate title and completed state
    Given path 'todos/<id>'
    When method get
    Then match response.title == '<title>'
    And match response.completed == '<completed>'

    Examples:
      | id | title                                          | completed  |
      | 35 | repellendus veritatis molestias dicta incidunt | true       |
      | 76 | sequi dolorem sed                              | true       |
      | 99 | neque voluptates ratione                       | false      |

  Scenario Outline: Verify todos returned successfully for specified userId
    Given path 'todos'
    And param userId = <userId>
    When method get
    Then status 200
    And assert response.length == <length>

  Examples:
      | userId | length |
      | 1      | 20     |
      | 2      | 20     |

  Scenario Outline: Verify completed todos returned successfully for specified userId
    Given path 'todos'
    And param userId = <userId>
    And param completed = true
    When method get
    Then status 200
    And assert response.length == <length>

    Examples:
      | userId | length |
      | 1      | 11     |
      | 3      | 7      |

  Scenario: Verify a new to-do is added successfully
    * def newTodo = read('classpath:data/newTodo.json')
    Given path 'todos'
    And request newTodo
    When method POST
    Then status 201

  Scenario: Verify a to-do is updated successfully
    * def updateTodo = read('classpath:data/updateTodo.json')
    Given path 'todos/21'
    And request updateTodo
    When method PUT
    Then status 200

  Scenario: Verify a to-do is deleted successfully
    Given path 'todos/25'
    When method DELETE
    Then status 200

  Scenario: Verify title length using custom java method
    Given path 'todos/82'
    When method GET
    * def title = response.title
    * def textLength = Java.type('utils.StringUtil').getLength(title)
    Then assert textLength == 32
