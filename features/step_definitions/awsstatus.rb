require 'httparty'

Given(/^I ask Odin for the status of all '([^']*)' instances$/) do |environmentType|
  @last_response = HTTParty.get('http://sc1midgard.pdnt.blackbaud.com/odin/environments/' + environmentType)
end

And(/^The machine named '([^']*)' exists in aws$/) do |rig_name|
  hashed_json = JSON.parse(@last_response.body)

  found = false

  for i in 0 .. hashed_json.length - 1
    found = true if hashed_json[i]["Name"] == rig_name
  end

  found.should == true
end

Then(/^The machine named '([^']*)' should have a status of '([^']*)'$/) do |rig_name, rig_status|
  hashed_json = JSON.parse(@last_response.body)

  for i in 0 .. hashed_json.length - 1
    hashed_json[i]["Status"].should == rig_status if hashed_json[i]["Name"] == rig_name
  end
end

Then(/^The machine named '([^']*)' with a unique identifier should have a status of '([^']*)'$/) do |rig_name, rig_status|
  rig_name = rig_name + @rig_id
  hashed_json = JSON.parse(@last_response.body)

  for i in 0 .. hashed_json.length - 1
    hashed_json[i]["Status"].should == rig_status if hashed_json[i]["Name"] == rig_name
  end
end

Given(/^I tell Odin to spin up a test rig named '([^']*)' with a unique identifier in '([^']*)'$/) do |rig_name, environment_type|
  rig_name = rig_name + @rig_id
  HTTParty.post('http://sc1midgard.pdnt.blackbaud.com/odin/environments/' + environment_type + '/' + rig_name, :body => {})
end

And(/^The machine named '([^']*)' with a unique identifier exists in aws$/) do |rig_name|
  rig_name = rig_name + @rig_id
  hashed_json = JSON.parse(@last_response.body)

  found = false

  for i in 0 .. hashed_json.length - 1
    found = true if hashed_json[i]["Name"] == rig_name
  end

  found.should == true
end

And(/^I tell Odin to spin down a test rig named '([^']*)' with a unique identifier in '([^']*)'$/) do |rig_name, environment_type|
  rig_name = rig_name + @rig_id
  HTTParty.delete('http://sc1midgard.pdnt.blackbaud.com/odin/environments/' + environment_type + '/' + rig_name, :body => {})
end

And(/^The machine named '([^']*)' with a unique identifier does not exist in aws$/) do |rig_name|
  rig_name = rig_name + @rig_id
  hashed_json = JSON.parse(@last_response.body)

  found = false

  for i in 0 .. hashed_json.length - 1
    found = true if hashed_json[i]["Name"] == rig_name
  end

  found.should == false
end

And(/^The machine named '([^']*)' with a unique identifier does not have a status of '([^']*)'$/) do |rig_name, rig_status|
  rig_name = rig_name + @rig_id
  hashed_json = JSON.parse(@last_response.body)

  for i in 0 .. hashed_json.length - 1
    hashed_json[i]["Status"].should_not == rig_status if hashed_json[i]["Name"] == rig_name
  end
end

And(/^I generate a random uid for the test rig$/) do
  @rig_id = rand(256256256).to_s
end
