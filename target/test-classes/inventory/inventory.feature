Feature: Inventory API Tests

  Background:
    * url baseUrl

  Scenario: Get all menu items
    Given path '/inventory'
    When method get
    Then status 200
    And match response.length >= 9
    And match each response contains { id: '#string', name: '#string', price: '#string', image: '#string' }

  Scenario: Filter by id
    Given path '/inventory/filter'
    And param id = 3
    When method get
    Then status 200
    And match response == { id: '3', name: 'Baked Rolls x 8', price: '$13', image: 'baked-rolls.png' }

  Scenario: Add item for non existent id
    Given path '/inventory/add'
    And request { id: '10', name: 'Hawaiian', image: 'hawaiian.png', price: '$14' }
    When method post
    Then status 200

  Scenario: Add item for existent id
    Given path '/inventory/add'
    And request { id: '10', name: 'Hawaiian', image: 'hawaiian.png', price: '$14' }
    When method post
    Then status 400

  Scenario: Add item with missing information
    Given path '/inventory/add'
    And request { name: 'No ID Pizza', image: 'no-id.png', price: '$12' }
    When method post
    Then status 400
    And match response.message == 'Not all requirements are met'

  Scenario: Validate recent added item is present
    Given path '/inventory'
    When method get
    Then status 200
    And match response contains { id: '10', name: 'Hawaiian', image: 'hawaiian.png', price: '$14' }
