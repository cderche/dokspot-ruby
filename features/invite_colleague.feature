Feature: invite colleague to join dokspot

	Scenario: Invite colleague with valid credentials
		Given I am logged in
		When I invite a colleague with the email "colleague@dokspot.com"
		Then I should see "An invitation email has been sent to colleague@dokspot.com."
		
	Scenario: Invite colleague with invalid credentials
		Given I am logged in
		When I invite a colleague with the email "notanemail"
		Then I should see "Email is invalid"
		
	Scenario: Invite colleague already in the system
		Given I am logged in
		When I invite a colleague with the email "user@example.com"
		Then I should see "Email has already been taken"