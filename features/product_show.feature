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
    | role      | owner | response                            | published   |
    | visitor   | a     | see "Access denied."                | unpublished |
    | manager   | a     | see "Access denied."                | unpublished |
    | operator  | a     | see "Access denied."                | unpublished |
    | admin     | a     | see the product details             | unpublished |
    | admin     | a     | see the EDIT product button         | unpublished |
    | admin     | a     | see the DELETE product button       | unpublished |
    | operator  | my    | see the product details             | unpublished |
    | operator  | my    | see the EDIT product button         | unpublished |
    | operator  | my    | see the DELETE product button       | unpublished |
    | manager   | my    | see the product details             | unpublished |
    | manager   | my    | see the EDIT product button         | unpublished |
    | visitor   | a     | see the product details             | published   |
    | visitor   | a     | not see the EDIT product button     | published   |
    | visitor   | a     | not see the DELETE product button   | published   |
    | manager   | a     | see "Access denied."                | published   |
    | operator  | a     | see "Access denied."                | published   |
    | admin     | a     | see the product details             | published   |
    | admin     | a     | see the EDIT product button         | published   |
    | admin     | a     | see the DELETE product button       | published   |
    | operator  | my    | see the product details             | published   |
    | operator  | my    | see the EDIT product button         | published   |
    | operator  | my    | see the DELETE product button       | published   |
    | manager   | my    | see the product details             | published   |
    | manager   | my    | see the EDIT product button         | published   |