Feature: View Company

  Scenario: View all companies
    Given I am logged in
    And I am an admin
    And a set of companies exist
    When I go to the company index
    Then I should see the set of companies
    
  Scenario: View company details as admin
    Given I am logged in
    And I am an admin
    When I visit a company
    Then I should see the company details
    
  Scenario: View company details as manager
    Given I am logged in
    And I am a manager
    And I have a company
    When I visit my company
    Then I should see the company details
    
  Scenario: View company details as operator
    Given I am logged in
    And I am an operator
    And I have a company
    When I visit my company
    Then I should see the company details
    
  Scenario: Edit company
    Given I am logged in
    And I am an admin
    When I edit a company
    Then I should see "Company was successfully updated."
    
  Scenario: Destroy company
    Given I am logged in
    And I am an admin
    When I destroy a company
    Then I should see "Company was successfully destroyed."