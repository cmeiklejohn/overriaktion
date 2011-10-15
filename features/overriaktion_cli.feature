Feature: Overriaktion CLI

  In order to remotely administer the Overriak service from the command line
  As a registered user with an API key
  I should be able to access the remote API via the CLI

  Scenario: Access help
    When I get help for "overriaktion"
    Then the exit status should be 0
    And the output should contain:
    """
    Usage: overriaktion api_key resource [operation]

    Client gem for the Overriak service.
    """
