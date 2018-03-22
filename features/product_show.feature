@validated
Feature: Show Products
  As a user of the website
  I want to see the product page
  so I can view the product information
  
  Scenario Outline: View product information
    Given I am a <role>
    And there is <owner> company with a <published> product
    When I visit the product page
    Then I should <response>
    
  Examples:
    | role      | owner | response                                              | published   |
    | visitor   | a     | see "You are not authorized to perform this action."  | unpublished |
    | manager   | a     | see "You are not authorized to perform this action."  | unpublished |
    | operator  | a     | see "You are not authorized to perform this action."  | unpublished |
    | admin     | a     | see the product details                               | unpublished |
    | admin     | a     | see the EDIT product button                           | unpublished |
    | admin     | a     | see the DELETE product button                         | unpublished |
    | operator  | my    | see the product details                               | unpublished |
    | operator  | my    | see the EDIT product button                           | unpublished |
    | operator  | my    | see the DELETE product button                         | unpublished |
    | manager   | my    | see the product details                               | unpublished |
    | manager   | my    | see the EDIT product button                           | unpublished |
    | visitor   | a     | see the product details                               | published   |
    | visitor   | a     | not see the EDIT product button                       | published   |
    | visitor   | a     | not see the DELETE product button                     | published   |
    | manager   | a     | see "You are not authorized to perform this action."  | published   |
    | operator  | a     | see "You are not authorized to perform this action."  | published   |
    | admin     | a     | see the product details                               | published   |
    | admin     | a     | see the EDIT product button                           | published   |
    | admin     | a     | see the DELETE product button                         | published   |
    | operator  | my    | see the product details                               | published   |
    | operator  | my    | see the EDIT product button                           | published   |
    | operator  | my    | see the DELETE product button                         | published   |
    | manager   | my    | see the product details                               | published   |
    | manager   | my    | see the EDIT product button                           | published   |