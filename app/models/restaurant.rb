class Restaurant < ActiveRecord::Base
	
	def self.from_location latitude, longitude
		parsed_url = URI.parse('https://maps.googleapis.com/maps/api/place/radarsearch/json?location=' + latitude + ',' + longitude + '&radius=5000&types=food&sensor=false&key=AIzaSyC-CNui9DmsDGjlESFKa-iK42r1x11jywc')
		http = Net::HTTP.new(parsed_url.host, parsed_url.port)
		http.use_ssl = true
		result = http.request(Net::HTTP::Get.new(parsed_url.request_uri))
        parsed_json = JSON.parse result.body
		format_results parsed_json["results"]
	end

	private

	def self.format_results results
    	results.map{|result| result["name"]}
   	end
end