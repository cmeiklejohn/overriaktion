Feature: Overriaktion CLI

  In order to remotely administer the Overriak service from the command line
  As a registered user with an API key
  I should be able to access the remote API via the CLI

  Scenario: Access help
    When I run `overriaktion --help`
    Then the exit status should be 0
    And the output should contain:
    """
    Usage: overriaktion api_key operation [cluster_name] [node_uri]

    Client gem for the Overriak service.
    """

  Scenario: List riak clusters
    When I run `overriaktion API_KEY list`
    Then the exit status should be 0
    And the output should contain:
    """
    Localhost
    """
