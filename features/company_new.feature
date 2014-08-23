Feature: New Company
  As a admin of the website
  I want to see the new company page
  so I can create fill in a new company's information

  Scenario: Click new company button
    Given I am a admin
    When I click on the new company button
    Then I should see the new company page
    
  Scenario:
    Given I am a admin
    When I create a company
    Then I should see a company successfully created message