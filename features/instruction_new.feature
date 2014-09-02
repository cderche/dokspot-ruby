Feature: New Instruction
  As a user of the website
  I want to see the new instruction page
  so I can fill in a new instruction's information

  
  Scenario Outline: Click new instruction button
    Given I am a <role>
    And there is <owner> company with a <published> product
    When I click on the NEW instruction button
    Then I should see the NEW instruction page
    
  Examples:
    | role      | owner | published   | 
    | admin     | a     | unpublished |
    | admin     | my    | unpublished |
    | manager   | my    | unpublished |
    | operator  | my    | unpublished |
    | admin     | a     | published   |
    | admin     | my    | published   |
    | manager   | my    | published   |
    | operator  | my    | published   |

  Scenario Outline:
    Given I am a <role>
    And there is <owner> company with a <published> product
    When I create a instruction
    Then I should see a instruction successfully created message
    
  Examples:
    | role      | owner | published   | 
    | admin     | a     | unpublished |
    | admin     | my    | unpublished |
    | manager   | my    | unpublished |
    | operator  | my    | unpublished |
    | admin     | a     | published   |
    | admin     | my    | published   |
    | manager   | my    | published   |
    | operator  | my    | published   |