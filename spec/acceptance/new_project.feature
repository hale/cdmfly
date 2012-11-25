Feature: Creating a new project from scratch
    Scenario: Launch with zero arguments
        When I run cdmfly from the command line by itself
        Then I should see some help text
