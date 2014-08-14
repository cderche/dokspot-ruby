Feature: Product Options

  Scenario Outline: Users should see all the product instructions
    Given I am a <role>
    And there is a set of languages
    And there is <owner> company
    And the company has a product
    And the product is <published>
    And a set of instructions exist for the product
    When I visit the product page
    Then I should see <response>
    
  Examples:
    | role      | published   | response                              | owner |
    | admin     | published   | the product instruction language name | my    |
    | manager   | published   | the product instruction language name | my    |
    | operator  | published   | the product instruction language name | my    |
    | visitor   | published   | the product instruction language name | my    |
    | admin     | unpublished | the product instruction language name | my    |
    | manager   | unpublished | the product instruction language name | my    |
    | operator  | unpublished | the product instruction language name | my    |
    | admin     | published   | the product instruction language name | a     |
    | manager   | published   | "Access denied."                      | a     |
    | operator  | published   | "Access denied."                      | a     |
    | visitor   | published   | the product instruction language name | a     |
    | admin     | unpublished | the product instruction language name | a     |
    | manager   | unpublished | "Access denied."                      | a     |
    | operator  | unpublished | "Access denied."                      | a     |
    | visitor   | unpublished | "Access denied."                      | a     |

  Scenario Outline: New Instruction link visibility
    Given I am a <role>
    And there is <owner> company
    And the company has a product
    And the product is <published>
    When I visit the product page
    Then I should <response>
    
  Examples:
    | role      | response                                                  | owner | published   |
    | admin     | see a "New Instruction" link                              | my    | published   |
    | manager   | see a "New Instruction" link                              | my    | published   |
    | operator  | see a "New Instruction" link                              | my    | published   |
    | admin     | see a "New Instruction" link                              | a     | published   |
    | manager   | not see a "New Instruction" link                          | a     | published   |
    | operator  | not see a "New Instruction" link                          | a     | published   |
    | visitor   | not see a "New Instruction" link                          | a     | published   |
    | admin     | see a "New Instruction" link                              | my    | unpublished |
    | manager   | see a "New Instruction" link                              | my    | unpublished |
    | operator  | see a "New Instruction" link                              | my    | unpublished |
    | admin     | see a "New Instruction" link                              | a     | unpublished |
    | manager   | not see a "New Instruction" link                          | a     | unpublished |
    | operator  | not see a "New Instruction" link                          | a     | unpublished |
    | visitor   | see "Access denied."                                      | a     | unpublished |
  
    
  Scenario: See all the product notifications