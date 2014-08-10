Feature: Signing in

	Scenario: Sign in with valid credentials
		Given I am a user
		When I sign in with valid credentials
		Then I should see "Signed in successfully."
		
	Scenario: Sign in with invalid credentials
		Given I am a user
		When I sign in with invalid credentials
		Then I should see "Invalid email or password."