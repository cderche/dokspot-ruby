Feature: Product Options

  Scenario Outline: Users should see all the product instructions
    Given I am a <role>
    And there is a set of languages
    And there is a company
    And the company has a product
    And the product is <published>
    And a set of instructions exist for the product
    When I visit the product page
    Then I should see <response>
    
  Examples:
    | role      | published   | response                              |
    | admin     | published   | the product instruction language name |
    | manager   | published   | "Access denied."                      |
    | operator  | published   | "Access denied."                      |
    | visitor   | published   | the product instruction language name |
    | admin     | unpublished | the product instruction language name |
    | manager   | unpublished | "Access denied."                      |
    | operator  | unpublished | "Access denied."                      |
    | visitor   | unpublished | "Access denied."                      |

  Scenario Outline: Edit product link visibility
    Given I am a <role>
    And there is a company
    And the company has a product
    When I visit the product page
    Then I should <response>
    
  Examples:
    | role      | response              |
    | admin     | see a "Edit" link     |
    | manager   | see a "Edit" link     |
    | operator  | see a "Edit" link     |
    | visitor   | not see a "Edit" link |
    
  Scenario: Users should see the add instruction link
  
  Scenario Outline: New Instruction product link visibility
    Given I am a <role>
    And there is a company
    And the company has a product
    And the product is <published>
    When I visit the product page
    Then I should <response>
    
  Examples:
    | role      | response                          | published   |
    | admin     | see a "New Instruction" link      | published   |
    | manager   | see "Access denied"               | published   |
    | operator  | see "Access denied"               | published   |
    | visitor   | not see a "New Instruction" link  | published   |
    | admin     | see a "New Instruction" link      | unpublished |
    | manager   | see "Access denied"               | unpublished |
    | operator  | see "Access denied"               | unpublished |
    | visitor   | see "Access denied"               | unpublished |
    
  Scenario: Users should see all the product notifications