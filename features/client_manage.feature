Feature: API need to create, read, update and delete clients

  Scenario: Create client
    Given a object with John as name and john@gmail.com as email
    When call for /clients at method post with this object as param
    Then I should receive code 200 and a client at JSON format

  Scenario: Visualizing client
    Given id equals 1 of a client
    When call for /clients/1
    Then I should receive code 200 and a client at JSON format with id 1