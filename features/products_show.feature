Feature: Show Products
  As a user of the website
  I want to see registered products for a company
  so I can know if the company has products
  
  Scenario Outline: Viewing products
    Given I am a <role>
    And there is <owner> company
    And a set of products exist
    When I visit the company page
    Then I should see <response>
    
    Examples:
      | role      | owner | response                                            |
      | visitor   | a     | "You need to sign in or sign up before continuing." |
      | operator  | a     | "Access denied"                                     |
      | manager   | a     | "Access denied"                                     |
      | admin     | a     | information about each product                      |
      | admin     | a     | the NEW product button                              |
      | manager   | my    | information about each product                      |
      | manager   | my    | the NEW product button                              |
      | operator  | my    | information about each product                      |
      | operator  | my    | the NEW product button                              |