Feature: Company options

  Scenario Outline: User should see company users
    Given I am a <role>
    And there is <owner> company
    And a set of users exist for the company
    When I visit the company page
    Then I should <response>
    
  Examples:
    | role      | owner | response                        |
    | admin     | my    | see the company user emails     |
    | manager   | my    | see the company user emails     |
    | operator  | my    | see the company user emails     |
    | admin     | a     | see the company user emails     |
    | manager   | a     | not see the company user emails |
    | operator  | a     | not see the company user emails |
    | visitor   | a     | not see the company user emails |
    
  Scenario Outline: User should see company products
    Given I am a <role>
    And there is <owner> company
    And a set of products exist for the company
    When I visit the company page
    Then I should <response>
    
  Examples:
    | role      | response                          | owner |
    | admin     | see the company product names     | my    |
    | manager   | see the company product names     | my    |
    | operator  | see the company product names     | my    |
    | admin     | see the company product names     | a     |
    | manager   | not see the company product names | a     |
    | operator  | not see the company product names | a     |
    | visitor   | not see the company product names | a     |
  
  Scenario Outline: User edit company link visibility
    Given I am a <role>
    And there is <owner> company
    When I visit the company page
    Then I should <response>
    
  Examples:
    | role      | owner | response                                                |
    | admin     | my    | see a "Edit Company" link                               |
    | manager   | my    | see a "Edit Company" link                               |
    | operator  | my    | not see a "Edit Company" link                           |
    | admin     | a     | see a "Edit Company" link                               |
    | manager   | a     | see "Access denied."                                    |
    | operator  | a     | see "Access denied."                                    |
    | visitor   | a     | see "You need to sign in or sign up before continuing." |
  
  Scenario Outline: User should see add product link
    Given I am a <role>
    And there is <owner> company
    When I visit the company page
    Then I should <response>
    
  Examples:
    | role      | response                                                | owner |
    | admin     | see a "New Product" link                                | my    |
    | manager   | see a "New Product" link                                | my    |
    | operator  | see a "New Product" link                                | my    |
    | admin     | see a "New Product" link                                | a     |
    | manager   | not see a "New Product" link                            | a     |
    | operator  | not see a "New Product" link                            | a     |
    | visitor   | see "You need to sign in or sign up before continuing." | a     |

  Scenario Outline: User should see add user link
    Given I am a <role>
    And there is <owner> company
    When I visit the company page
    Then I should <response>
    
  Examples:
    | role      | response                                                | owner |
    | admin     | see a "New User" link                                   | my    |
    | manager   | see a "New User" link                                   | my    |
    | operator  | see a "New User" link                                   | my    |
    | admin     | see a "New User" link                                   | a     |
    | manager   | not see a "New User" link                               | a     |
    | operator  | not see a "New User" link                               | a     |
    | visitor   | see "You need to sign in or sign up before continuing." | a     |
  
  Scenario Outline: User should see add company link
    Given I am a <role>
    When I visit the companies index page
    Then I should see <response>
    
  Examples:
    | role      | response                                            |
    | admin     | a "New Company" link                                |
    | manager   | "Access denied."                                    |
    | operator  | "Access denied."                                    |
    | visitor   | "You need to sign in or sign up before continuing." |
  
  Scenario Outline: Should see company names
    Given I am a <role>
    And a set of companies exist
    When I visit the companies index page
    Then I should see <response>
    
  Examples:
    | role      | response                                            |
    | admin     | the company names and links                         |
    | manager   | "Access denied."                                    |
    | operator  | "Access denied."                                    |
    | visitor   | "You need to sign in or sign up before continuing." |