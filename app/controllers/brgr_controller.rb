require 'uri'
require 'net/http'

class BrgrController < ApplicationController
  def brgr
	parsed_url = URI.parse('https://maps.googleapis.com/maps/api/place/radarsearch/json?location=48.859294,2.347589&radius=5000&types=food&sensor=false&keyword=vegetarian&key=AIzaSyC-CNui9DmsDGjlESFKa-iK42r1x11jywc')
	http = Net::HTTP.new(parsed_url.host, parsed_url.port)
	http.use_ssl = true
	request = Net::HTTP::Get.new(parsed_url.request_uri)

	@result = http.request(request)
  end
end
