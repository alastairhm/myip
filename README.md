###Monitor a servers remote address

Idea is to have a Ruby script which runs from crontab which checks you servers external IP and Tweets you if it changes.
Useful if you have a non-static IP address with your broadband router.

1 config_ru Simple what's my external IP Rack App as mentioned on http://stackoverflow.com/questions/13270042/get-public-remote-ip-address
2 remote_ip.rb Ruby script to check IP and tweet on changes
3 remote_io.txt Text file with previous IP address for conparision
