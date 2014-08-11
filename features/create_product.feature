Feature: create product

  Scenario: Create a new product with valid data
    Given I am logged in
    And I have a company
    When I create a product with valid data
    Then I should see "Product was successfully created."
    
  Scenario: Create a new product with valid data as an admin
    Given I am logged in
    And I am an admin
    And a set of companies exist
    When I create a product with valid data
    Then I should see "Product was successfully created."
    
  Scenario: Create a new product with incomplete data
    Given I am logged in
    And I have a company
    When I create a product with incomplete data
    Then I should see "can't be blank"
    
  Scenario: Create product already in the system
    Given I am logged in
    When I create an existing product
    Then I should see "has already been taken"