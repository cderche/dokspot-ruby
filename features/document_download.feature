Feature: Download a document
  As a user of the website
  I want to download the document
  so I can view the document contents
  
  @skip
  Scenario: Download primary document
    Given I am a admin
    And there is a "published" product belonging to "my" company has a "published" instruction
    And the instruction has a document
    When I visit the product page
    And I click the PRIMARY button
    Then I should download the document