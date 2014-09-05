@validated
Feature: Delete Companies
  As a admin of the website
  I want to delete a company from the website
  so I can remove them from our company list
  
  Scenario: Click delete button
    Given I am a admin
    And there is a company
    When I visit the company page
    And I click on the DELETE company button
    Then I should see the company successfully deleted message