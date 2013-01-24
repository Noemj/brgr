require 'uri'
require 'net/http'
require 'json'

class BrgrController < ApplicationController::Base
  def show
	@latitude = params[:messages][:latitude]
	@longitude = params[:messages][:longitude]
	@names = Restaurant.restaurant_from_location @latitude @longitude
  end

  def add
    render 'add'
  end 

end
