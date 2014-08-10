Feature: Create Company

	Scenario: Create a new company with valid data
		Given I am logged in
		When I create a company with valid data
		Then I should see "Company was successfully created."
		
	Scenario: Create company already in the system
	  Given I am logged in
	  When I create an existing company
	  Then I should see "has already been taken"
	  
  Scenario: Create a new company with incomplete data
    Given I am logged in
    When I create a incomplete company
    Then I should see "can't be blank"