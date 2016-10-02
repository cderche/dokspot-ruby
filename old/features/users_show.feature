@validated
Feature: Show Users
  As a user of the website
  I want to see registered users listed on the a company page
  so I can know if the company has users

    Scenario Outline: Viewing users
      Given I am a <role>
      And a set of users exists for the company
      When I visit the company page
      Then I should see <response>
      
    Examples:
    | role      | response                                            |
    | admin     | information on each user                            |
    | manager   | information on each user                            |
    | operator  | information on each user                            |
    | visitor   | "You need to sign in or sign up before continuing." |