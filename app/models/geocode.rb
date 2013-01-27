require 'uri'
require 'net/http'
require 'json'

class Geocode < ActiveRecord::Base

	def self.from_address address
		parsed_url = URI.parse('http://maps.googleapis.com/maps/api/geocode/json?address=' + address + '&sensor=false')
		http = Net::HTTP.new(parsed_url.host, parsed_url.port)
		result = http.request(Net::HTTP::Get.new(parsed_url.request_uri))
		parsed_json = JSON.parse result.body
		latitude = parsed_json["results"]["geometry"]["location"]["lat"]
		longitude = parsed_json["results"]["geometry"]["location"]["lng"]
		return latitude, longitude
	end
end
