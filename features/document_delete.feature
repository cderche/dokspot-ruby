@validated
Feature: Delete document
  As a user of the website
  I want to delete a document from my instruction
  so I can remove them from our document list

  Scenario Outline: Click delete button
    Given I am a <role>
    And there is a <p_pub> product belonging to <owner> company has a <i_pub> instruction
    #And the instruction has a document
    # there must be multiple documents
    And there is a set of documents for the instruction
    When I visit the instruction page
    And I click on the DELETE document button
    Then I should see the document successfully deleted message
    
  Examples:
    | role      | p_pub         | owner | i_pub         |
    | admin     | "published"   | "my"  | "published"   |
    | admin     | "published"   | "my"  | "unpublished" |
    | admin     | "unpublished" | "my"  | "published"   |
    | admin     | "unpublished" | "my"  | "unpublished" |
    | admin     | "published"   | "a"   | "published"   |
    | admin     | "published"   | "a"   | "unpublished" |
    | admin     | "unpublished" | "a"   | "published"   |
    | admin     | "unpublished" | "a"   | "unpublished" |
    | manager   | "published"   | "my"  | "published"   |
    | manager   | "published"   | "my"  | "unpublished" |
    | manager   | "unpublished" | "my"  | "published"   |
    | manager   | "unpublished" | "my"  | "unpublished" |
    | operator  | "published"   | "my"  | "published"   |
    | operator  | "published"   | "my"  | "unpublished" |
    | operator  | "unpublished" | "my"  | "published"   |
    | operator  | "unpublished" | "my"  | "unpublished" |