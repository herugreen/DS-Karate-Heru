Feature: petstore user API Test

  Background:
    * url baseURL

  Scenario: Create a new User
    Given path 'user'
    And request { "id": 1, "username": "herugreen", "firstName": "Heru", "lastName": "Gunadi", "email": "heru.eleven@email.com", "password": "sukses2024", "phone": "085720232024", "userStatus": 1 }
    When method POST
    Then status 200

  Scenario: Get user by Username
    Given path 'user/herugreen'
    When method GET
    Then status 200
    And match response == { "id": 1, "username": "herugreen", "firstName": "Heru", "lastName": "Gunadi", "email": "heru.eleven@email.com", "password": "sukses2024", "phone": "085720232024", "userStatus": 1 }

  Scenario: Log in User
    Given path 'user/login'
    And request { "username": "herugreen", "password": "sukses2024" }
    When method GET
    Then status 200

  Scenario: Log out current logged in User Session
    Given path 'user/logout'
    When method GET
    Then status 200
    And match response == { "code": 200, "type": "unknown", "message": "ok" }

  Scenario: Delete user
    Given path 'user/herugreen'
    When method DELETE
    Then status 200

  Scenario: Verify user deletion
    Given path 'user/herugreen'
    When method GET
    Then status 404
    And match response == { "code": 1, "type": "error", "message": "User not found" }