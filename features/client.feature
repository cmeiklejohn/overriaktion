@overriak
Feature: Client

  In order to remotely administer the Overriak service
  as a registered user with an API key
  I should be able to access the remote API via the client gem.

  Background: 
    Given I have a valid API key and an instance of the client

  Scenario: Retrieve a list of riak clusters
    When I make a request to the API to retrieve my list of riak clusters
    Then I should have a list containing the "Localhost" riak cluster

  Scenario: Retrieve one riak cluster
    When I make a request to the API to retrieve one riak cluster
    Then I should have the "Localhost" riak cluster

  Scenario: Retrieve one riak cluster's riak nodes
    When I make a request to the API to retrieve one riak cluster
    Then I should have the "Localhost" riak cluster
    When I make a request to the API to retrive the riak clusters riak nodes
    Then I should have a list containing the "root@127.0.0.1:8098" riak node

  Scenario: Retrieve one riak node in a riak cluster
    When I make a request to the API to retrieve one riak cluster
    Then I should have the "Localhost" riak cluster
    When I make a request to the API to retrive one riak node the riak cluster
    Then I should have the "root@127.0.0.1:8098" riak node
