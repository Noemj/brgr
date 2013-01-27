require 'uri'
require 'net/http'
require 'json'

class Geocode < ActiveRecord::Base

	def self.from_address address
		query = 'http://maps.googleapis.com/maps/api/geocode/json?address=' + address + '&sensor=false'
		parsed_url = URI.parse(query.gsub(' ', '%20'))
		http = Net::HTTP.new(parsed_url.host, parsed_url.port)
		result = http.request(Net::HTTP::Get.new(parsed_url.request_uri))
		parsed_json = JSON.parse result.body
		unless parsed_json.nil? || parsed_json.empty?
			latitude = parsed_json["results"][0]["geometry"]["location"]["lat"]
			longitude = parsed_json["results"][0]["geometry"]["location"]["lng"]
			return latitude, longitude
		end		
	end
end
