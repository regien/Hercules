require "oauth2"
require "json"

UID = "1daa37bc29728a64a69be5a3e4d78b547776fa3e67806e081153413533112a07"
SECRET = "878574dafe0e11ce71dcbc6ff3f174e1d6a57596aed275d81315a1957abb7827"
client = OAuth2::Client.new(UID, SECRET, site: "https://api.intra.42.fr")
token = client.client_credentials.get_token

RequestedUser = {}
begin
File.open(ARGV[0], "r") do |f|
f.each_line do |line|
RequestedUser[line.chomp] = "isn't online!"
end
end
rescue Errno::ENOENT, TypeError
puts "No file :'("
exit -1
end

response = token.get("/v2/campus")
response.parsed.each { |id|
		uresp = token.get("/v2/campus/#{id['id']}/locations")
				uresp.parsed.each { |uid|
						if (RequestedUser[uid["user"]["login"]] == "isn't online!")
								RequestedUser[uid["user"]["login"]] = uid["host"]
										end
				}
}

RequestedUser.each { |x,val| puts "#{x} #{val}" }
