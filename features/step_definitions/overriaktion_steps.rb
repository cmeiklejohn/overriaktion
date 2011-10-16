# Setup

Given /^I have a valid API key and an instance of the client$/ do
  @client = Overriaktion.new(:api_key => '1')
end

Given /^I have a riak cluster named "([^"]*)" with an id of "([^"]*)"$/ do |cluster_name, id|
  stub_request(:get, "http://#{Configuration.api_host}/riak_clusters/#{id}.json").
    to_return(:status => 200, :body => Responses::JSON::RIAK_CLUSTER, :headers => {})
  stub_request(:get, "http://#{Configuration.api_host}/riak_clusters.json").
    to_return(:status => 200, :body => Responses::JSON::RIAK_CLUSTERS, :headers => {})
end

Given /^I have a riak node wih ip address "([^"]*)" and id "([^"]*)" in cluster "([^"]*)" with an id of "([^"]*)"$/ do |cluster_name, riak_cluster_id, ip_address, id|
  stub_request(:get, "http://#{Configuration.api_host}/riak_clusters/#{riak_cluster_id}/riak_nodes.json").
    to_return(:status => 200, :body => Responses::JSON::RIAK_NODES, :headers => {})
  stub_request(:get, "http://#{Configuration.api_host}/riak_clusters/#{riak_cluster_id}/riak_nodes/#{id}.json").
    to_return(:status => 200, :body => Responses::JSON::RIAK_NODE, :headers => {})
end

# Requests 

When /^I make a request to the API to retrieve my list of riak clusters$/ do
  @riak_clusters = @client.riak_clusters
end

When /^I make a request to the API to retrieve one riak cluster with an id of "([^"]*)"$/ do |id|
  @riak_cluster = @client.riak_cluster(id)
end

When /^I make a request to the API to retrieve my list of riak nodes in cluster "([^"]*)" with an id of "([^"]*)"$/ do |cluster_name, id|
  @riak_cluster = @client.riak_cluster(id)
  @riak_nodes   = @riak_cluster.riak_nodes
end

When /^I make a request to the API to retrieve the riak node with ip "([^"]*)" and id "([^"]*)" in cluster "([^"]*)" with an id of "([^"]*)"$/ do |ip_address, id, cluster_name, riak_cluster_id|
  @riak_cluster = @client.riak_cluster(riak_cluster_id)
  @riak_node    = @riak_cluster.riak_node(id)
end

# Matchers 

Then /^I should have an array returned with (\d+) cluster named "([^"]*)" with an id of "([^"]*)"$/ do |count, cluster_name, id|
  @riak_clusters.select { |o| o.is_a?(RiakCluster) }.
                 select { |o| o.id == id.to_i }.
                 select { |o| o.name == cluster_name }.
                 length.should == count.to_i
end

Then /^I should have an object returned for the cluster named "([^"]*)" with an id of "([^"]*)"$/ do |cluster_name, id|
  @riak_cluster.id.should == id.to_i
  @riak_cluster.name.should == cluster_name
  @riak_cluster.should be_a_kind_of(RiakCluster)
end

Then /^I should have an array returned with (\d+) node with ip_address "([^"]*)" with an id of "([^"]*)"$/ do |count, ip_address, id|
  @riak_nodes.select { |o| o.is_a?(RiakNode) }.
              select { |o| o.id == id.to_i }.
              select { |o| o.ip_address == ip_address }.
              length.should == count.to_i
end

Then /^I should have an object returned for the riak node with ip "([^"]*)" and id "([^"]*)" in cluster named "([^"]*)" with an id of "([^"]*)"$/ do |ip_address, id, cluster_name, riak_cluster_id|
  @riak_node.id.should == id.to_i
  @riak_node.ip_address.should == ip_address
  @riak_node.should be_a_kind_of(RiakNode)
end
