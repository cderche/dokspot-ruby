Feature: Edit Companies
  As a user of the website
  I want to see the edit company page
  so I can edit the company information
  
  Scenario Outline: Click edit button
    Given I am a <role>
    When I visit the company page
    And I click on the EDIT company button
    Then I should see the EDIT company page
    
    Examples:
      | role    |
      | admin   |
      | manager |
      
  Scenario Outline: View edit company fields
    Given I am a <role>
    When I visit the company edit page
    Then I should see <response>
    
    Examples:
      | role      | response                                            |
      | admin     | the EDIT company fields                             |
      | manager   | the EDIT company fields                             |
      | operator  | "Access denied."                                    |
      | visitor   | "You need to sign in or sign up before continuing." |
      
  Scenario Outline: Edit company
    Given I am a <role>
    When I edit the company
    Then I should see a company successfully edited message

    Examples:
      | role    |
      | admin   |
      | manager |