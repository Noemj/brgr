class BrgrController < ApplicationController

	def show
		@address = params[:messages][:address]
		@latitude, @longitude = Geocode.from_address @address
		@radius = params[:messages][:radius]
		@restaurant = Restaurant.from_location @latitude, @longitude, @radius
	end

	def add
	end 

end
