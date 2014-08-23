Feature: Show Companies
  As a admin of the website
  I want to see registered companies listed on the a companies index page
  so I can know if the website has companies
  
  Scenario Outline: Viewing companies
    Given I am a <role>
    And a set of companies exists
    When I visit the companies index page
    Then I should see <response>
    
    Examples:
    | role      | response                                            |
    | manager   | "Access denied."                                    |
    | operator  | "Access denied."                                    |
    | visitor   | "You need to sign in or sign up before continuing." |
    | admin     | information on each company                         |
    | admin     | a button for add a new company                      |