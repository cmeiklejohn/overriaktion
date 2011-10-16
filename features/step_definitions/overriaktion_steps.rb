Given /^I have a valid API key and client$/ do
  @client = Overriaktion.new(:api_key => '1')
end

Given /^I have a riak cluster named "([^"]*)"$/ do |cluster_name|
  stub_request(:get, "http://#{Configuration.api_host}/riak_clusters/1.json").
    to_return(:status => 200, :body => Responses::JSON::RIAK_CLUSTER, :headers => {})
  stub_request(:get, "http://#{Configuration.api_host}/riak_clusters.json").
    to_return(:status => 200, :body => Responses::JSON::RIAK_CLUSTERS, :headers => {})
end

When /^I make a request to the API to retrieve my list of riak clusters$/ do
  @clusters = @client.riak_clusters
end

Then /^I should have an array returned with (\d+) cluster named "([^"]*)"$/ do |count, cluster_name|
  @clusters.select { |o| o.is_a?(RiakCluster) }.
            select { |o| o.name == cluster_name }.length.should == count.to_i
end

When /^I make a request to the API to retrieve one riak cluster$/ do
  @cluster = @client.riak_cluster(1)
end

Then /^I should have an object returned for the cluster named "([^"]*)"$/ do |cluster_name|
  @cluster.should be_a_kind_of(RiakCluster)
  @cluster.name.should == cluster_name
end

Given /^I have a riak node wih ip address "([^"]*)" in cluster "([^"]*)"$/ do |cluster_name, ip_address|
  stub_request(:get, "http://#{Configuration.api_host}/riak_clusters/1/riak_nodes.json").
    to_return(:status => 200, :body => Responses::JSON::RIAK_NODES, :headers => {})
  stub_request(:get, "http://#{Configuration.api_host}/riak_clusters/1/riak_nodes/1.json").
    to_return(:status => 200, :body => Responses::JSON::RIAK_NODE, :headers => {})
end

When /^I make a request to the API to retrieve my list of riak nodes in cluster "([^"]*)"$/ do |cluster_name|
  @cluster = @client.riak_cluster(1)
  @nodes = @cluster.riak_nodes
end

Then /^I should have an array returned with (\d+) node with ip_address "([^"]*)"$/ do |count, ip_address|
  @nodes.select { |o| o.is_a?(RiakNode) }.
         select { |o| o.ip_address == ip_address }.length.should == count.to_i
end

When /^I make a request to the API to retrieve the riak node with ip "([^"]*)" in cluster "([^"]*)"$/ do |ip_address, cluster_name|
  @cluster = @client.riak_cluster(1)
  @node = @cluster.riak_node(1)
end

Then /^I should have an object returned for the riak node with ip "([^"]*)" in cluster named "([^"]*)"$/ do |ip_address, cluster_name|
  @node.should be_a_kind_of(RiakNode)
  @node.ip_address.should == ip_address
end
