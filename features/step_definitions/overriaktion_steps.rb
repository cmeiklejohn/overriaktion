Given /^I have a valid API key$/ do
  @client = Overriaktion.new(:api_key => '1')
end

Given /^I have a riak cluster named "([^"]*)"$/ do |cluster_name|
  stub_request(:get, "http://#{Overriaktion::Configuration.api_host}/riak_clusters.json").
    to_return(:status => 200, :body => Overriaktion::Responses::JSON::RIAK_CLUSTERS, :headers => {})
end

When /^I make a request to the API to retrieve my list of riak clusters$/ do
  @clusters = @client.riak_clusters
end

Then /^I should have an array returned with (\d+) cluster named "([^"]*)"$/ do |count, name|
  @clusters.select { |o| o.is_a?(Overriaktion::RiakCluster) }.
            select { |o| o.name == name }.length.should == count.to_i
end
