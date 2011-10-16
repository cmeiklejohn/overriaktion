Feature: Overriaktion

  In order to remotely administer the Overriak service
  As a registered user with an API key
  I should be able to access the remote API

  Background: 
    Given I have a valid API key
    And I have a riak cluster named "Localhost"

  Scenario: Retrieve list of riak clusters
    When I make a request to the API to retrieve my list of riak clusters
    Then I should have an array returned with 1 cluster named "Localhost"
