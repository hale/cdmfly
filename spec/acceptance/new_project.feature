Feature: Creating a new project from the command line
  Scenario: Run with no arguments
    When I run "cdmfly new sample_project"
    Then I should see "Creating new project 'sample_project'"
    And I should see "Your projects are stored on Github, so we need to authenticate."
    
  Scenario: Authenticating with Github
    When I enter "hale"
    And I enter ""
