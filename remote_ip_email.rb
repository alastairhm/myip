#!/usr/bin/ruby
require 'open-uri'
require 'httparty'

oldfile = File.expand_path(File.join(File.dirname(__FILE__), "remote_ip.txt"))

remote_ip = open('http://myip-ahm.herokuapp.com').read

old_ip = File.open(oldfile, 'r').read

puts remote_ip

if (remote_ip != old_ip) then
	File.open(oldfile, "w") { |file|  file.write(remote_ip)}

	puts "The new IP address is #{remote_ip} from #{old_ip}"
		url = "https://sendgrid.com/api/mail.send.json"

	response = HTTParty.post url, :body => {
	  "api_user" => "alastairmontgomery",
	  "api_key" => "^O8%k2WF#to@E76f",
	  "to" => "doodle.m@gmail.com",
	  "from" => "alastair@raspberry-pi.me",
	  "subject" => "Raspberry Pi's IP has changed",
	  "text" => "The new IP address is #{remote_ip} from #{old_ip}"
	}

	puts response.body
else
    puts "IP addresses match"
end
