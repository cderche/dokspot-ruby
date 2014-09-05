@validated
Feature: Demote users
  As a manager of a company
  I should be able to promote operators
  
  Scenario: Demote user
    Given I am a admin
    And there is a company
    And a set of users exists for the company
    When I visit the company page
    And I click on the DEMOTE button for a user 
    Then I should user demoted message