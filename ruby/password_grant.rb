
#Ruby example to user password oauth grant to log in

require 'rest_client'
require 'json'
require "base64"


user = ""
password = ""
clientid=""
secret=""


@env="mypurecloud"
@authendpoint = "https://signin.#{@env}.com"
@apiendpoint = "https://public-api.us-east-1.#{@env}.com"

puts @apiendpoint

headers = {'Authorization' => "Basic " + Base64.strict_encode64("#{clientid}:#{secret}"),
    :content_type => "application/x-www-form-urlencoded",
    :accept => :json,
}

http_resource = RestClient::Resource.new("#{@authendpoint}", :headers => headers)

begin
    oauthResponse = JSON.parse http_resource['/token'].post("grant_type=password&username=#{user}&password=#{password}")
rescue Exception => e
    puts e.inspect
    puts 'Unable to log in with those credentials'
    exit
end


headers = {'Authorization' => 'bearer ' + oauthResponse['
    '],
    :content_type => :json,
    :accept => :json,
}

puts headers

http_resource = RestClient::Resource.new("#{@apiendpoint}", :headers => headers)
puts http_resource['/api/v1/users/me'].get();
