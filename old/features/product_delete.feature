@validated
Feature: Delete products
  As a user of the website
  I want to delete a product from my company
  so I can remove them from our product list
  
  Scenario Outline: Click delete button
    Given I am a <role>
    And there is <owner> company with a <published> product
    When I visit the product page
    And I click on the DELETE product button
    Then I should see the product successfully deleted message
    
  Examples:
    | role      | owner | published   |
    | admin     | a     | published   |
    | admin     | a     | unpublished |
    | admin     | my    | published   |
    | admin     | my    | unpublished |
    | manager   | my    | published   |
    | manager   | my    | unpublished |
    | operator  | my    | published   |
    | operator  | my    | unpublished |