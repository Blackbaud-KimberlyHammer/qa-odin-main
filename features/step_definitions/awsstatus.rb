require 'httparty'

Given(/^I ask Odin for the status of all '([^']*)' instances$/) do |environmentType|
  @last_response = HTTParty.get('http://sc1midgard.pdnt.blackbaud.com/odin/environments/' + environmentType)
end

Then(/^The machine named '([^']*)' should have a status of '([^']*)'$/) do |rig_name, rig_status|
  hashed_json = JSON.parse(@last_response.body)

  for i in 0 .. hashed_json.length - 1
    hashed_json[i]["Status"].should == rig_status if hashed_json[i]["Name"] == rig_name
  end
end

Given(/^I tell Odin to spin up a test rig named '([^']*)' in '([^']*)'$/) do |rig_name, environment_type|
  @last_response = HTTParty.post('http://sc1midgard.pdnt.blackbaud.com/odin/environments/' + environment_type + '/' + rig_name, :body => {})
end

Then(/^The machine named '([^']*)' exists$/) do |rig_name|
  hashed_json = JSON.parse(@last_response.body)

  found = false

  for i in 0 .. hashed_json.length - 1
    found = true if hashed_json[i]["Name"] == rig_name
  end

  found.should == true
end

And(/^I tell Odin to spin down a test rig named '([^']*)' in '([^']*)'$/) do |rig_name, environment_type|
  @last_response = HTTParty.delete('http://sc1midgard.pdnt.blackbaud.com/odin/environments/' + environment_type + '/' + rig_name, :body => {})
end