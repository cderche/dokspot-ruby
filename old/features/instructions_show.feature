@validated
Feature: Show Instructions
  As a user of the website
  I want to see the instructions for a registered product
  so I can know if the product has instructions
  
  Scenario Outline: Viewing instructions
    Given I am a <role>
    And there is a set of instructions for a <published> product belonging to <owner> company
    And a set of products exist
    When I visit the product page
    Then I should see <response>
    
    Examples:
      | role      | published   | owner | response                                          |
      | admin     | published   | a     | ALL instructions                                  |
      | admin     | published   | my    | ALL instructions                                  |
      | admin     | unpublished | a     | ALL instructions                                  |
      | admin     | unpublished | my    | ALL instructions                                  |
      | manager   | published   | a     | "You are not authorized to perform this action."  |
      | manager   | published   | my    | ALL instructions                                  |
      | manager   | unpublished | a     | "You are not authorized to perform this action."  |
      | manager   | unpublished | my    | ALL instructions                                  |
      | operator  | published   | a     | "You are not authorized to perform this action."  |
      | operator  | published   | my    | ALL instructions                                  |
      | operator  | unpublished | a     | "You are not authorized to perform this action."  |
      | operator  | unpublished | my    | ALL instructions                                  |
      | visitor   | published   | a     | PUBLISHED instructions                            |
      | visitor   | unpublished | a     | "You are not authorized to perform this action."  |