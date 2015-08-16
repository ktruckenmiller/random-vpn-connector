require 'rubygems'
require 'open-uri'

system("echo 'creating new connection'")
@randomVPN = Dir["./certs/*"].sample
@current_ip = open('http://whatismyip.akamai.com').read
puts "Current IP: " + @current_ip
system("sudo killall openvpn")
system("sudo openvpn --config #{@randomVPN} --daemon")

@new_ip = @current_ip
while @new_ip == @current_ip
	@new_ip = open('http://whatismyip.akamai.com').read
	sleep(2)
end	
puts "New IP: " + @new_ip
# system("curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'")