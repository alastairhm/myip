#!/usr/bin/ruby
require 'open-uri'
require 'twitter' #https://github.com/sferik/twitter for config details

require File.expand_path(File.join(File.dirname(__FILE__), "twitterCode.rb"))
twitDM = "alastair_hm"

#remote_ip = open('http://whatismyip.akamai.com').read
remote_ip = open('http://myip-ahm.herokuapp.com').read
old_ip = File.open('remote_ip.txt', 'r').read

puts remote_ip

if (remote_ip != old_ip) then
    File.open('remote_ip.txt', "w") { |file|  file.write(remote_ip)}

    client = Twitter::REST::Client.new do |config|
        config.consumer_key        = @twitterCodes[0]
        config.consumer_secret     = @twitterCodes[1]
        config.access_token        = @twitterCodes[2]
        config.access_token_secret = @twitterCodes[3]
    end

    client.update("D #{twitDM} My IP address is now #{remote_ip}")

else
    puts "IP addresses match"
end
