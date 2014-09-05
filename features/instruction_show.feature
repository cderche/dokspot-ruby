@validated
Feature: Show Instructions
  As a user of the website
  I want to see the instruction page
  so I can view the instruction information
  
  Scenario Outline: View instruction information
    Given I am a <role>
    And there is a <p_pub> product belonging to <owner> company has a <i_pub> instruction
    When I visit the instruction page
    Then I should <response>
    
  Examples:
    | role      | p_pub         | owner | i_pub         | response  |
    | admin     | "unpublished" | "a"   | "unpublished" | see the instruction details       |
    | admin     | "unpublished" | "a"   | "published"   | see the instruction details       |
    | admin     | "unpublished" | "my"  | "unpublished" | see the instruction details       |
    | admin     | "unpublished" | "my"  | "published"   | see the instruction details       |
    | admin     | "published"   | "a"   | "unpublished" | see the instruction details       |
    | admin     | "published"   | "a"   | "published"   | see the instruction details       |
    | admin     | "published"   | "my"  | "unpublished" | see the instruction details       |
    | admin     | "published"   | "my"  | "published"   | see the instruction details       |
    
    | manager   | "unpublished" | "a"   | "unpublished" | see "You are not authorized to perform this action."  |
    | manager   | "unpublished" | "a"   | "published"   | see "You are not authorized to perform this action."  |
    
    | manager   | "unpublished" | "my"  | "unpublished" | see the instruction details       |
    | manager   | "unpublished" | "my"  | "published"   | see the instruction details       |
    
    | manager   | "published"   | "a"   | "unpublished" | see "You are not authorized to perform this action."  |
    | manager   | "published"   | "a"   | "published"   | see "You are not authorized to perform this action."  |
    
    | manager   | "published"   | "my"  | "unpublished" | see the instruction details       |
    | manager   | "published"   | "my"  | "published"   | see the instruction details       |
    
    | operator  | "unpublished" | "a"   | "unpublished" | see "You are not authorized to perform this action."  |
    | operator  | "unpublished" | "a"   | "published"   | see "You are not authorized to perform this action."  |
    
    | operator  | "unpublished" | "my"  | "unpublished" | see the instruction details       |
    | operator  | "unpublished" | "my"  | "published"   | see the instruction details       |
    
    
    | operator  | "published"   | "a"   | "unpublished" | see "You are not authorized to perform this action."  |
    | operator  | "published"   | "a"   | "published"   | see "You are not authorized to perform this action."  |
    
    | operator  | "published"   | "my"  | "unpublished" | see the instruction details       |
    | operator  | "published"   | "my"  | "published"   | see the instruction details       |
    
    | visitor   | "unpublished" | "a"   | "unpublished" | see "You are not authorized to perform this action."  |
    | visitor   | "unpublished" | "a"   | "published"   | see "You are not authorized to perform this action."  |
    | visitor   | "published"   | "a"   | "unpublished" | see "You are not authorized to perform this action."  |
    | visitor   | "published"   | "a"   | "published"   | see the instruction details       |
    
    
    
    #| admin     | "unpublished" | "a"   | "unpublished" | see the EDIT instruction button   |
    #| admin     | "unpublished" | "a"   | "unpublished" | see the DELETE instruction button |
    #| admin     | "unpublished" | "a"   | "published"   | see the EDIT instruction button   |
    #| admin     | "unpublished" | "a"   | "published"   | see the DELETE instruction button |
    #| admin     | "unpublished" | "my"  | "unpublished" | see the EDIT instruction button   |
    #| admin     | "unpublished" | "my"  | "unpublished" | see the DELETE instruction button |
    #| admin     | "unpublished" | "my"  | "published"   | see the EDIT instruction button   |
    #| admin     | "unpublished" | "my"  | "published"   | see the DELETE instruction button |
    #| admin     | "published"   | "a"   | "unpublished" | see the EDIT instruction button   |
    #| admin     | "published"   | "a"   | "unpublished" | see the DELETE instruction button |
    #| admin     | "published"   | "a"   | "published"   | see the EDIT instruction button   |
    #| admin     | "published"   | "a"   | "published"   | see the DELETE instruction button |
    #| admin     | "published"   | "my"  | "unpublished" | see the EDIT instruction button   |
    #| admin     | "published"   | "my"  | "unpublished" | see the DELETE instruction button |
    #| admin     | "published"   | "my"  | "published"   | see the EDIT instruction button   |
    #| admin     | "published"   | "my"  | "published"   | see the DELETE instruction button |
    #| manager   | "unpublished" | "my"  | "unpublished" | see the EDIT instruction button   |
    #| manager   | "unpublished" | "my"  | "unpublished" | see the DELETE instruction button |
    #| manager   | "unpublished" | "my"  | "published"   | see the EDIT instruction button   |
    #| manager   | "unpublished" | "my"  | "published"   | see the DELETE instruction button |
    #| manager   | "published"   | "my"  | "unpublished" | see the EDIT instruction button   |
    #| manager   | "published"   | "my"  | "unpublished" | see the DELETE instruction button |
    #| manager   | "published"   | "my"  | "published"   | see the EDIT instruction button   |
    #| manager   | "published"   | "my"  | "published"   | see the DELETE instruction button |
    #| operator  | "unpublished" | "my"  | "unpublished" | see the EDIT instruction button   |
    #| operator  | "unpublished" | "my"  | "unpublished" | see the DELETE instruction button |
    #| operator  | "unpublished" | "my"  | "published"   | see the EDIT instruction button   |
    #| operator  | "unpublished" | "my"  | "published"   | see the DELETE instruction button |
    #| operator  | "published"   | "my"  | "unpublished" | see the EDIT instruction button   |
    #| operator  | "published"   | "my"  | "unpublished" | see the DELETE instruction button |
    #| operator  | "published"   | "my"  | "published"   | see the EDIT instruction button   |
    #| operator  | "published"   | "my"  | "published"   | see the DELETE instruction button |