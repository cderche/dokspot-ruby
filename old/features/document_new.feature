@validated
Feature: New Document
  As a user of the website
  I want to see the new document page
  so I can fill in a new documents's information

  
  Scenario Outline: Click new document button
    Given I am a <role>
    And there is a <p_pub> product belonging to <owner> company has a <i_pub> instruction
    When I click on the NEW document button
    Then I should see the NEW document page
    
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

  Scenario Outline:
    Given I am a <role>
    And there is a <p_pub> product belonging to <owner> company has a <i_pub> instruction
    When I create a document
    Then I should see a document successfully created message
    
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