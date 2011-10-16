Feature: Overriaktion

  In order to remotely administer the Overriak service
  As a registered user with an API key
  I should be able to access the remote API

  Background: 
    Given I have a valid API key and client
    And I have a riak cluster named "Localhost"
    And I have a riak node wih ip address "127.0.0.1" in cluster "Localhost"

  Scenario: Retrieve list of riak clusters
    When I make a request to the API to retrieve my list of riak clusters
    Then I should have an array returned with 1 cluster named "Localhost"

  Scenario: Retrieve one riak cluster
    When I make a request to the API to retrieve one riak cluster
    Then I should have an object returned for the cluster named "Localhost"

  Scenario: Retrieve one riak cluster's riak nodes
    When I make a request to the API to retrieve one riak cluster
    Then I should have an object returned for the cluster named "Localhost"
    When I make a request to the API to retrieve my list of riak nodes in cluster "Localhost"
    Then I should have an array returned with 1 node with ip_address "127.0.0.1" 

  Scenario: Retrieve one of riak cluster's riak nodes
    When I make a request to the API to retrieve one riak cluster
    Then I should have an object returned for the cluster named "Localhost"
    When I make a request to the API to retrieve the riak node with ip "127.0.0.1" in cluster "Localhost"
    Then I should have an object returned for the riak node with ip "127.0.0.1" in cluster named "Localhost"
