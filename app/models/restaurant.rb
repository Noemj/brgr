require 'uri'
require 'net/http'
require 'json'

class Restaurant < ActiveRecord::Base
	
	SEARCH_RADIUS = 5000

	attr_reader :name, :latitude, :longitude

	def initialize options
		@name = options["name"]
		@latitude = options["lat"]
		@longitude = options["lng"]
	end

	def self.from_location latitude, longitude
		restaurants = all_from_location latitude, longitude
		restaurants.first
	end

	def self.all_from_location latitude, longitude
		all_information = fetch_information latitude, longitude
		format_results all_information["results"]
	end

	private

	def self.from_location latitude, longitude
		parsed_url = URI.parse('https://maps.googleapis.com/maps/api/place/radarsearch/json?location=#{latitude},#{longitude}&radius=#{SEARCH_RADIUS}&types=food&sensor=false&key=AIzaSyC-CNui9DmsDGjlESFKa-iK42r1x11jywc')
		http = Net::HTTP.new(parsed_url.host, parsed_url.port)
		http.use_ssl = true
		result = http.request(Net::HTTP::Get.new(parsed_url.request_uri))
		JSON.parse result.body
	end

	def self.format_results results
		results.map{|result| result["name"]}
	end
end