require 'httparty'


@rig_id = rand(256256256)

#puts @rig_id

environment_type = 'aws'

rig_name = 'testing1'

@last_response = HTTParty.get('http://default-environment.2nrpjenag9.us-east-1.elasticbeanstalk.com/hello/Team%20Nautilus')

puts @last_response

#@last_response = HTTParty.post('http://sc1midgard.pdnt.blackbaud.com/odin/environments/' + environment_type + '/' + rig_name, :body => {})

#printf(@last_response.body)

#hashed_json = JSON.parse(@last_response.body)

#for i in 0 .. hashed_json.length - 1
#  printf "#{hashed_json[i]["Status"]}" if hashed_json[i]["Name"] == "Bastion"
#end