Given(/^I contact the nautilus elastic beanstalk endpoint$/) do
  @last_response = HTTParty.get('http://default-environment.2nrpjenag9.us-east-1.elasticbeanstalk.com/hello/Team%20Nautilus')
end

Then(/^It tells me '([^']*)'$/) do |response_message|
  puts @last_response
  @last_response.body.should == response_message
end