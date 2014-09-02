Feature: Show Documents
  As a user of the website
  I want to see the documents for a instruction
  so I can know if the instruction has documents
  
  Scenario Outline: Viewing documents
    Given I am a <role>
    And there is a <p_pub> product belonging to <owner> company has a <i_pub> instruction
    And there is a set of documents for the instruction
    When I visit the instruction page
    Then I should see <response>
    
    Examples:
      | role      | p_pub         | owner | response        | i_pub         |
      | admin     | "published"   | "a"   | ALL documents   | "unpublished" |
      | admin     | "published"   | "my"  | ALL documents   | "unpublished" |
      | admin     | "unpublished" | "a"   | ALL documents   | "unpublished" |
      | admin     | "unpublished" | "my"  | ALL documents   | "unpublished" |
      | manager   | "published"   | "a"   | "Access denied" | "unpublished" |
      | manager   | "published"   | "my"  | ALL documents   | "unpublished" |
      | manager   | "unpublished" | "a"   | "Access denied" | "unpublished" |
      | manager   | "unpublished" | "my"  | ALL documents   | "unpublished" |
      | operator  | "published"   | "a"   | "Access denied" | "unpublished" |
      | operator  | "published"   | "my"  | ALL documents   | "unpublished" |
      | operator  | "unpublished" | "a"   | "Access denied" | "unpublished" |
      | operator  | "unpublished" | "my"  | ALL documents   | "unpublished" |
      | visitor   | "published"   | "a"   | "Access denied" | "unpublished" |
      | visitor   | "unpublished" | "a"   | "Access denied" | "unpublished" |
      
      | admin     | "published"   | "a"   | ALL documents   | "published"   |
      | admin     | "published"   | "my"  | ALL documents   | "published"   |
      | admin     | "unpublished" | "a"   | ALL documents   | "published"   |
      | admin     | "unpublished" | "my"  | ALL documents   | "published"   |
      | manager   | "published"   | "a"   | "Access denied" | "published"   |
      | manager   | "published"   | "my"  | ALL documents   | "published"   |
      | manager   | "unpublished" | "a"   | "Access denied" | "published"   |
      | manager   | "unpublished" | "my"  | ALL documents   | "published"   |
      | operator  | "published"   | "a"   | "Access denied" | "published"   |
      | operator  | "published"   | "my"  | ALL documents   | "published"   |
      | operator  | "unpublished" | "a"   | "Access denied" | "published"   |
      | operator  | "unpublished" | "my"  | ALL documents   | "published"   |
      | visitor   | "published"   | "a"   | ALL documents   | "published"   |
      | visitor   | "unpublished" | "a"   | "Access denied" | "published"   |