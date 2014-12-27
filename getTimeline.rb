require 'rubygems'
require 'oauth'
require 'json'

# get timeline
baseurl = "https://api.twitter.com"
path    = "/1.1/statuses/user_timeline.json"
query   = URI.encode_www_form(
    "screen_name" => "twitterapi",
    "count" => 10,
)
address = URI("#{baseurl}#{path}?#{query}")
request = Net::HTTP::Get.new address.request_uri

# method to print the timeline
def print_timeline(tweets)
  # ADD CODE TO ITERATE THROUGH EACH TWEET AND PRINT ITS TEXT
  tweets.each do |tweet| puts tweet['text'] end
  

end

# HTTP Setup
http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER


consumer_key ||= OAuth::Consumer.new "", ""
access_token ||= OAuth::Token.new "", ""

# request 
request.oauth! http, consumer_key, access_token
http.start
response = http.request request

# check 200 response code
tweets = nil
if response.code == '200' then
  tweets = JSON.parse(response.body)
  print_timeline(tweets)
end
nil
