Feature: New Product
  As a user of the website
  I want to see the new product page
  so I can fill in a new product's information

  Scenario Outline: Click new company button
    Given I am a <role>
    And there is <owner> company
    When I click on the NEW product button
    Then I should see the NEW product page
    
  Examples:
    | role      | owner |
    | admin     | a     |
    | admin     | my    |
    | manager   | my    |
    | operator  | my    |
    
  Scenario Outline:
    Given I am a <role>
    And there is <owner> company
    When I create a product
    Then I should see a product successfully created message
    
  Examples:
    | role      | owner |
    | admin     | a     |
    | admin     | my    |
    | manager   | my    |
    | operator  | my    |