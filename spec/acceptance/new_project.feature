Feature: Creating a new project from scratch
    Scenario: Launch with zero arguments
        When I run cdmfly
        Then I should see some help text
