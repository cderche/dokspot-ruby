Feature: view product

  Scenario: View all products for a certain company
    Given I am logged in
    And I have a company
    And the company has a set of products
    When I visit my company
    Then I should see the company products
    
  Scenario: View product details
    Given there exists a product
    When I visit that product
    Then I should see the product details
    
  Scenario: Edit product
    Given I am logged in
    And I have a company
    And the company has a set of products
    When I edit one of the company products
    Then I should see "Product was successfully updated."
    
  Scenario: Destroy product
    Given I am logged in
    And I have a company
    And the company has a set of products
    When I destroy one of the company products
    Then I should see "Product was successfully destroyed."