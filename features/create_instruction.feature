Feature: Create Instruction

  Scenario: Create a new instruction with valid data
    Given I am logged in
    And I have a company with a product
    When I create a new instruction with valid data
    Then I should see "Instruction was successfully created."