@order
Feature: Show order / orders

  Scenario Outline: Admin, Manager or Operator views orders
    Given I am a <role>
    And there is <owner> company
    And a set of orders exist
    When I visit the company page
    Then I should see the set of orders
    
    Examples:
    | role      | owner |
    | admin     | a     |
    | admin     | my    |
    | manager   | my    |
    | operator  | my    |
    
  Scenario Outline: Admin, Manager or Operator views specific order
    Given I am a <role>
    And there is <owner> company
    And an order exists
    When I visit the order
    Then I should see the order information
    
    Examples:
    | role      | owner |
    | admin     | a     |
    | admin     | my    |
    | manager   | my    |
    | operator  | my    |
    
  Scenario Outline: Visitor views order with valid code
    Given I am a visitor
    And an order exists
    When I visit the order page with a <validity> code
    Then I should <response>
    
    Examples:
    | validity  | response                          |
    | valid     | see the order details             | 
    | invalid   | see a order code invalid message  |