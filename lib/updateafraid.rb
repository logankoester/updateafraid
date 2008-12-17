%w{rubygems digest/sha1 happymapper open-uri}.each { |r| require r }

module Updateafraid
	class AfraidAccount	
		attr_accessor :username, :password, :domains
		def initialize(username, password)
			@username, @password = username, password
			@domains = self.getdyndns
		end
		
		def getdyndns
			sha1 = Digest::SHA1.hexdigest(@username+'|'+@password)
			xml = open("http://freedns.afraid.org/api/" + 
				"?action=getdyndns"+"&sha="+sha1+"&style=xml", "User-Agent" => 'updateafraid.rb').read
			return Domain.parse(xml)
		end
		
		def update_all
			responses = Array.new
			@domains.each do |domain|
				responses.push domain.host + " - " + domain.update
			end
			return responses
		end
		
		def update(domain)
			o = false
			self.domains.each { |d|
				if d.host == domain
					o = d.update
					break
				end
			}
			return o
		end
		
		def print_domains
			puts "You have " + self.domains.size.to_s + " domains:"
			self.domains.each do |d| puts d.host + "\t(" + d.address + ")" end
		end
		
	end
		
	class Domain
		include HappyMapper
		tag 'item'
		element :host, String
		element :address, String
		element :url, String
		
		def update
			open(@url).read
		end
		
	end
	
end
