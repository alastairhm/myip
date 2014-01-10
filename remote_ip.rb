#!/usr/bin/ruby
require 'open-uri'
require 'twitter'

twitDM = "alastair_hm"

remote_ip = open('http://whatismyip.akamai.com').read
old_ip = File.open('remote_ip.txt', 'r').read

if (remote_ip != old_ip) then
    File.open('remote_ip.txt', "w") { |file|  file.write(remote_ip)}

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ""
      config.consumer_secret     = ""
      config.access_token        = ""
      config.access_token_secret = ""
    end

    client.update("D #{twitDM} My IP address is now #{remote_ip}")

else
    puts "IP addresses match"
end
