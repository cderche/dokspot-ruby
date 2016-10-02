@order
Feature: Edit order

  Scenario Outline: Admin, Manager or Operator sees edit order button
    Given I am a <role>
    And there is <owner> company
    And an order exists
    When I visit the order
    Then I should see the edit order button
    
    Examples:
    | role      | owner |
    | admin     | a     |
    | admin     | my    |
    | manager   | my    |
    | operator  | my    |
    
  Scenario Outline: Visitor sees edit order button
    Given I am a visitor
    And an order exists
    And the order <processed>
    When I visit the order page with a valid code
    Then I should <response>
    
    Examples:
    | processed               | response                      |
    | has been processed      | not see the edit order button | 
    | has not been processed  | see the edit order button     |
    
  Scenario Outline: Visitor can see edit order page
    Given I am a visitor
    And an order exists
    And the order <processed>
    When I visit the order edit page
    Then I should <response>
    
  Examples:
  | processed               | response                              |
  | has been processed      | see a order already processed message | 
  | has not been processed  | see the visitor edit order fields     |
  
  Scenario: Visitor cancels order
    Given I am a visitor
    And an order exists
    And the order has not been processed
    When I cancel the order
    Then I should see a order cancelled message
    
  Scenario Outline: Admin, Manager, or Operator updates order status
    Given I am a <role>
    And there is <owner> company
    And an order exists
    When I visit the order edit page
    Then I should see the user edit order fields
    
  Examples:
    | role      | owner |
    | admin     | a     |
    | admin     | my    |
    | manager   | my    |
    | operator  | my    |