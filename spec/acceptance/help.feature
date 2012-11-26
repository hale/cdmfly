Feature: Help
  Scenario: Launch with zero arguments
    When I run cdmfly
    Then I should see "Usage: cdmfly <command> [<args>]"
    And I should see "Commands"
    And I should see the following information:
      | info   | display information about this project           |
      | start  | start cdmfly in this directory                   |
      | new    | creates a new project                            |
      | launch | open the project page in the default web browser |
    And I should see "For help with specific commands run: cdmfly <command> help"
