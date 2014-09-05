@validated
Feature: Show Companies
  As a user of the website
  I want to see the company page
  so I can view the company information
  
  Scenario Outline: View company information
    Given I am a <role>
    And there is <owner> company
    When I visit the company page
    Then I should <response>
    
  Examples:
    | role      | owner | response                                                |
    | visitor   | a     | see "You need to sign in or sign up before continuing." |
    | manager   | a     | see "You are not authorized to perform this action."    |
    | operator  | a     | see "You are not authorized to perform this action."    |
    | admin     | a     | see the company details                                 |
    | admin     | a     | see the EDIT company button                             |
    | admin     | a     | see the DELETE company button                           |
    | operator  | my    | see the company details                                 |
    | operator  | my    | not see the EDIT company button                         |
    | operator  | my    | not see the DELETE company button                       |
    | manager   | my    | see the company details                                 |
    | manager   | my    | see the EDIT company button                             |