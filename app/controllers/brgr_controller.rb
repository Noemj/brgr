class BrgrController < ApplicationController::Base
  def show
	@latitude = params[:messages][:latitude]
	@longitude = params[:messages][:longitude]
	@names = Restaurant.from_location @latitude @longitude
  end

  def add
  end 

end
