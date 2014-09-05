@validated
Feature: Edit Products
  As a user of the website
  I want to see the edit product page
  so I can edit the product information
  
  Scenario Outline: Click edit button
    Given I am a <role>
    And there is <owner> company with a <published> product
    When I visit the product page
    And I click on the EDIT product button
    Then I should see the EDIT product page
    
    Examples:
      | role      | published   | owner |  
      | admin     | published   | my    |
      | admin     | published   | a     |
      | admin     | unpublished | my    |
      | admin     | unpublished | a     |
      | manager   | unpublished | my    |
      | manager   | published   | my    |
      | operator  | unpublished | my    |
      | operator  | published   | my    |
  
  Scenario Outline: View edit product fields
    Given I am a <role>
    And there is <owner> company with a <published> product
    When I visit the product EDIT page
    Then I should see <response>
    
    Examples:
      | role      | response                                            | owner | published   |
      | admin     | the EDIT product fields                             | my    | published   |
      | manager   | the EDIT product fields                             | my    | published   |
      | operator  | the EDIT product fields                             | my    | published   |
      | admin     | the EDIT product fields                             | my    | unpublished |
      | manager   | the EDIT product fields                             | my    | unpublished |
      | operator  | the EDIT product fields                             | my    | unpublished |
      | visitor   | "You need to sign in or sign up before continuing." | a     | published   |
      | visitor   | "You need to sign in or sign up before continuing." | a     | unpublished |
      | admin     | the EDIT product fields                             | a     | published   |
      | manager   | "You are not authorized to perform this action."    | a     | published   |
      | operator  | "You are not authorized to perform this action."    | a     | published   |
      | admin     | the EDIT product fields                             | a     | unpublished |
      | manager   | "You are not authorized to perform this action."    | a     | unpublished |
      | operator  | "You are not authorized to perform this action."    | a     | unpublished |
      
  Scenario Outline: Edit product
    Given I am a <role>
    And there is <owner> company with a <published> product
    When I EDIT the product
    Then I should see a product successfully edited message

    Examples:
      | role      | owner | published   |
      | admin     | my    | published   |
      | admin     | my    | unpublished |
      | admin     | a     | published   |
      | admin     | a     | unpublished |
      | manager   | my    | published   |
      | manager   | my    | unpublished |
      | operator  | my    | published   |
      | operator  | my    | unpublished |