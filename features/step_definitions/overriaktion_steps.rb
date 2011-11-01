# Setup

Given /^I have a valid API key and an instance of the client$/ do
  @client = Overriaktion.new(:api_key => '1')
end

# Requests 

When /^I make a request to the API to retrieve my list of riak clusters$/ do
  @riak_clusters = @client.riak_clusters
end

When /^I make a request to the API to retrieve one riak cluster$/ do
  @riak_cluster = @client.riak_cluster(1)
end

When /^I make a request to the API to retrive the riak clusters riak nodes$/ do
  @riak_nodes = @riak_cluster.riak_nodes
end

When /^I make a request to the API to retrive one riak node the riak cluster$/ do
  @riak_node = @riak_cluster.riak_node(1)
end

# Matchers 

Then /^I should have a list containing the "([^"]*)" riak cluster$/ do |cluster_name|
  @riak_clusters.select { |cluster| cluster.to_s == cluster_name }.length.should == 1
end

Then /^I should have the "([^"]*)" riak cluster$/ do |cluster_name|
  @riak_cluster.to_s.should == cluster_name
end

Then /^I should have a list containing the "([^"]*)" riak node$/ do |node_uri|
  @riak_nodes.select { |node| node.to_s == node_uri }.length.should == 1
end

Then /^I should have the "([^"]*)" riak node$/ do |node_uri|
  @riak_node.to_s.should == node_uri
end
