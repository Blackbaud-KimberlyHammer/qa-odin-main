require 'httparty'

environment_type = 'aws'

@last_response = HTTParty.get('http://sc1midgard.pdnt.blackbaud.com/odin/environments/' + environment_type)

hashed_json = JSON.parse(@last_response.body)

for i in 0 .. hashed_json.length - 1
  printf "#{hashed_json[i]["Status"]}" if hashed_json[i]["Name"] == "Bastion"
end