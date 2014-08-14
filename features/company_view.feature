Feature: Ensure the company views show the correct items

### INDEX ###

  Scenario Outline: Company index items
    Given I am a <role>
    And a set of companies exist
    When I visit the companies index page
    Then I should see <response>
    
  Examples:
    | role      | response                                            |
    | manager   | "Access denied."                                    |
    | operator  | "Access denied."                                    |
    | visitor   | "You need to sign in or sign up before continuing." |
    | admin     | the company information and links                   |
    | admin     | a New Company link                                  |
    
### SHOW ###

  Scenario Outline: Company show items
    Given I am a <role>
    And there is <owner> company
    And a set of products exist for the company
    And a set of users exist for the company
    When I visit the company page
    Then I should see <response>
    
  Examples:
    | role      | owner | response                                            |
    | visitor   | a     | "You need to sign in or sign up before continuing." |
    | manager   | a     | "Access denied."                                    |
    | operator  | a     | "Access denied."                                    |
    | admin     | a     | the company details                                 |
    | admin     | a     | a Edit Company link                                 |
    | admin     | a     | a Delete Company link                               |
    | admin     | a     | a Back link                                         |
    | admin     | a     | the company product list                            |
    | admin     | a     | a New Product link                                  |
    | admin     | a     | the company user list                               |
    | admin     | a     | a New User link                                     |
    | admin     | my    | the company details                                 |
    | admin     | my    | a Edit Company link                                 |
    | admin     | my    | a Delete Company link                               |
    | admin     | my    | a Back link                                         |
    | admin     | my    | the company product list                            |
    | admin     | my    | a New Product link                                  |
    | admin     | my    | the company user list                               |
    | admin     | my    | a New User link                                     |
    | manager   | my    | the company details                                 |
    | manager   | my    | a Edit Company link                                 |
    | manager   | my    | a Back link                                         |
    | manager   | my    | the company product list                            |
    | manager   | my    | a New Product link                                  |
    | manager   | my    | the company user list                               |
    | manager   | my    | a New User link                                     |
    | operator  | my    | the company details                                 |
    | operator  | my    | a Edit Company link                                 |
    | operator  | my    | a Back link                                         |
    | operator  | my    | the company product list                            |
    | operator  | my    | a New Product link                                  |
    | operator  | my    | the company user list                               |
    | operator  | my    | a New User link                                     |