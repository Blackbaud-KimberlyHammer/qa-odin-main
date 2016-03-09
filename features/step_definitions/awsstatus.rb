require 'httparty'

Given(/^I ask Odin for the status of all '([^']*)' instances$/) do |environmentType|
  @last_response = HTTParty.get('http://sc1midgard.pdnt.blackbaud.com/odin/environments/' + environmentType)
end

Then(/^The machine named '([^']*)' should have a status of '([^']*)'$/) do |testMachineName, testMachineStatus|
  # need to loop through responses to find bastion and verify that it is running
  hashed_json = JSON.parse(@last_response.body)

  for i in 0 .. hashed_json.length - 1
    hashed_json[i]["Status"].should == testMachineStatus if hashed_json[i]["Name"] == testMachineName
  end
end
