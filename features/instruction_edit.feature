Feature: Edit Instruction
  As a user of the website
  I want to see the edit instruction page
  so I can edit the instruction information
  
  Scenario Outline: Click edit button
    Given I am a <role>
    And there is a <p_pub> product belonging to <owner> company has a <i_pub> instruction
    When I visit the instruction page
    And I click on the EDIT instruction button
    Then I should see the EDIT instruction page
    
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
      
  Scenario Outline: View edit instruction fields
    Given I am a <role>
    And there is a <p_pub> product belonging to <owner> company has a <i_pub> instruction
    When I visit the instruction EDIT page
    Then I should see <response>
    
    Examples:
      | role      | p_pub         | owner | i_pub         | response                    |
      | admin     | "published"   | "my"  | "published"   | the EDIT instruction fields |
      | admin     | "published"   | "my"  | "unpublished" | the EDIT instruction fields |
      | admin     | "unpublished" | "my"  | "published"   | the EDIT instruction fields |
      | admin     | "unpublished" | "my"  | "unpublished" | the EDIT instruction fields |
      | admin     | "published"   | "a"   | "published"   | the EDIT instruction fields |
      | admin     | "published"   | "a"   | "unpublished" | the EDIT instruction fields |
      | admin     | "unpublished" | "a"   | "published"   | the EDIT instruction fields |
      | admin     | "unpublished" | "a"   | "unpublished" | the EDIT instruction fields |
      
      | manager   | "published"   | "my"  | "published"   | the EDIT instruction fields |
      | manager   | "published"   | "my"  | "unpublished" | the EDIT instruction fields |
      | manager   | "unpublished" | "my"  | "published"   | the EDIT instruction fields |
      | manager   | "unpublished" | "my"  | "unpublished" | the EDIT instruction fields |
      | manager   | "published"   | "a"   | "published"   | "Access denied."            |
      | manager   | "published"   | "a"   | "unpublished" | "Access denied."            |
      | manager   | "unpublished" | "a"   | "published"   | "Access denied."            |
      | manager   | "unpublished" | "a"   | "unpublished" | "Access denied."            |
      
      | operator  | "published"   | "my"  | "published"   | the EDIT instruction fields |
      | operator  | "published"   | "my"  | "unpublished" | the EDIT instruction fields |
      | operator  | "unpublished" | "my"  | "published"   | the EDIT instruction fields |
      | operator  | "unpublished" | "my"  | "unpublished" | the EDIT instruction fields |
      | operator  | "published"   | "a"   | "published"   | "Access denied."            |
      | operator  | "published"   | "a"   | "unpublished" | "Access denied."            |
      | operator  | "unpublished" | "a"   | "published"   | "Access denied."            |
      | operator  | "unpublished" | "a"   | "unpublished" | "Access denied."            |
      
      | visitor   | "published"   | "a"   | "published"   | "You need to sign in or sign up before continuing." |
      | visitor   | "published"   | "a"   | "unpublished" | "You need to sign in or sign up before continuing." |
      | visitor   | "unpublished" | "a"   | "published"   | "You need to sign in or sign up before continuing." |
      | visitor   | "unpublished" | "a"   | "unpublished" | "You need to sign in or sign up before continuing." |
   
  Scenario Outline: Edit instruction
    Given I am a <role>
    And there is a <p_pub> product belonging to <owner> company has a <i_pub> instruction
    When I EDIT the instruction
    Then I should see a instruction successfully edited message

    Examples:
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