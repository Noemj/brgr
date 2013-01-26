class BrgrController < ApplicationController

	def show
		@latitude = params[:messages][:latitude]
		@longitude = params[:messages][:longitude]
		@radius = params[:messages][:radius]
		@restaurant = Restaurant.from_location @latitude, @longitude, @radius
	end

	def add
	end 

end
