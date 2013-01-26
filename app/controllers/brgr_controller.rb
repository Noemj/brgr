class BrgrController < ApplicationController

	def show
		@latitude = params[:messages][:latitude]
		@longitude = params[:messages][:longitude]
		@restaurant = Restaurant.from_location @latitude, @longitude
	end

	def add
	end 

end
