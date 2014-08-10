Feature: View Company

  Scenario: View all companies
    Given I am logged in
    And a set of companies exist
    When I go to the company index
    Then I should see the set of companies
    
  Scenario: View company details
    Given I am logged in
    When I visit a company
    Then I should see the company details
    
  Scenario: Edit company
    Given I am logged in
    When I edit a company
    Then I should see "Company was successfully updated."
    
  Scenario: Destroy company
    Given I am logged in
    When I destroy a company
    Then I should see "Company was successfully destroyed."