@validated
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
      | manager   | "published"   | "a"   | "You are not authorized to perform this action." | "unpublished" |
      | manager   | "published"   | "my"  | ALL documents   | "unpublished" |
      | manager   | "unpublished" | "a"   | "You are not authorized to perform this action." | "unpublished" |
      | manager   | "unpublished" | "my"  | ALL documents   | "unpublished" |
      | operator  | "published"   | "a"   | "You are not authorized to perform this action." | "unpublished" |
      | operator  | "published"   | "my"  | ALL documents   | "unpublished" |
      | operator  | "unpublished" | "a"   | "You are not authorized to perform this action." | "unpublished" |
      | operator  | "unpublished" | "my"  | ALL documents   | "unpublished" |
      | visitor   | "published"   | "a"   | "You are not authorized to perform this action." | "unpublished" |
      | visitor   | "unpublished" | "a"   | "You are not authorized to perform this action." | "unpublished" |
      
      | admin     | "published"   | "a"   | ALL documents   | "published"   |
      | admin     | "published"   | "my"  | ALL documents   | "published"   |
      | admin     | "unpublished" | "a"   | ALL documents   | "published"   |
      | admin     | "unpublished" | "my"  | ALL documents   | "published"   |
      | manager   | "published"   | "a"   | "You are not authorized to perform this action." | "published"   |
      | manager   | "published"   | "my"  | ALL documents   | "published"   |
      | manager   | "unpublished" | "a"   | "You are not authorized to perform this action." | "published"   |
      | manager   | "unpublished" | "my"  | ALL documents   | "published"   |
      | operator  | "published"   | "a"   | "You are not authorized to perform this action." | "published"   |
      | operator  | "published"   | "my"  | ALL documents   | "published"   |
      | operator  | "unpublished" | "a"   | "You are not authorized to perform this action." | "published"   |
      | operator  | "unpublished" | "my"  | ALL documents   | "published"   |
      | visitor   | "published"   | "a"   | ALL documents   | "published"   |
      | visitor   | "unpublished" | "a"   | "You are not authorized to perform this action." | "published"   |