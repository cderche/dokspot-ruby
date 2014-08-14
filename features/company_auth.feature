Feature: Company Authentication and Authorization


### SHOW ###
    
  Scenario Outline: User tries to view company
    Given I am a <role>
    And there is <owner> company
    When I visit the company page
    Then I should <response>
    
  Examples:
    | role      | owner | response                                                |
    | admin     | my    | see the company details                                 |
    | manager   | my    | see the company details                                 |
    | operator  | my    | see the company details                                 |
    | admin     | a     | see the company details                                 |
    | manager   | a     | see "Access denied."                                    |
    | operator  | a     | see "Access denied."                                    |
    | visitor   | a     | see "You need to sign in or sign up before continuing." |
    
### NEW ###
    
  Scenario Outline: User tries to create a new company
    Given I am a <role>
    When I visit the create company page
    Then I should see <response>
    
  Examples:
    | role      | response                                            |
    | admin     | "New company"                                       |
    | manager   | "Access denied."                                    |
    | operator  | "Access denied."                                    |
    | visitor   | "You need to sign in or sign up before continuing." |
    
### EDIT ###

  Scenario Outline: User tries to edit his company
    Given I am a <role>
    And there is <owner> company
    When I visit the company edit page
    Then I should see <response>
    
  Examples:
    | role      | response                                            | owner |
    | admin     | "Editing company"                                   | my    |
    | manager   | "Editing company"                                   | my    |
    | operator  | "Access denied."                                    | my    |
    | admin     | "Editing company"                                   | a     |
    | manager   | "Access denied."                                    | a     |
    | operator  | "Access denied."                                    | a     |
    | visitor   | "You need to sign in or sign up before continuing." | a     |
    
### CREATE ###

  Scenario Outline: User tries creates new company
    Given I am a <role>
    When I visit the create company page
    And I submit the create company form
    Then I should see <response>
    
  Examples:
    | role      | response                            |
    | admin     | "Company was successfully created." |
    
### UPDATE ###
  
  Scenario Outline: User tries to update a company
    Given I am a <role>
    And there is <owner> company
    When I visit the company edit page
    And I submit the edit company form
    Then I should see <response>
    
    Examples:
      | role      | response                            | owner |
      | admin     | "Company was successfully updated." | my    |
      | manager   | "Company was successfully updated." | my    |
      | admin     | "Company was successfully updated." | a     |
    
### DESTROY ###

  Scenario Outline: Destroy company link
    Given I am a <role>
    And there is <owner> company
    When I visit the company page
    Then I should <response>
  
  Examples:
    | role      | owner | response                                                |
    | admin     | my    | not see a "Destroy Company" link                        |
    | manager   | my    | not see a "Destroy Company" link                        |
    | operator  | my    | not see a "Destroy Company" link                        |
    | admin     | a     | see a "Destroy Company" link                            |
    | manager   | a     | see "Access denied."                                    |
    | operator  | a     | see "Access denied."                                    |
    | visitor   | a     | see "You need to sign in or sign up before continuing." |
    
  
  Scenario Outline: Destroy a company
    Given I am a <role>
    And there is <owner> company
    When I try to destroy the company
    Then I should see <response>
    
    Examples:
      | role      | response                                            | owner |
      | admin     | "Access denied."                                    | my    |
      | manager   | "Access denied."                                    | my    |
      | operator  | "Access denied."                                    | my    |
      | admin     | "Company was successfully destroyed."               | a     |
      | manager   | "Access denied."                                    | a     |
      | operator  | "Access denied."                                    | a     |
      | visitor   | "You need to sign in or sign up before continuing." | a     |