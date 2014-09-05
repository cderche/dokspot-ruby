@validated
Feature: Promote users
  As a manager of a company
  I should be able to promote operators
  
  Scenario Outline: Promote user
    Given I am a <role>
    And there is <owner> company
    And a set of users exists for the company
    When I visit the company page
    And I click on the PROMOTE button for a user 
    Then I should user promoted message
    
  Examples:
    | role      | owner |
    | admin     | a     |
    | manager   | my    |