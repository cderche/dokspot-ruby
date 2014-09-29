@order
Feature: Create Order

  Scenario: Click new order button
    Given there is a "published" product belonging to "a" company has a "published" instruction
    And I am a visitor
    When I visit the product page
    And I click on the order button
    Then I should see the NEW order page
  
  Scenario: Create new order
    Given there is a "published" product belonging to "a" company has a "published" instruction
    And I am a visitor
    When I create a new order
    Then I should see a order successfully created message
      