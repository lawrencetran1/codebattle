class PagesController < ApplicationController
  def index
  	@challenges = Challenge.all.page(params[:page])
  end

  def contact
    url = "https://maps.googleapis.com/maps/api/js?key="
    key = ENV['GOOGLE_MAPS']
    @endpoint = url + key  	
  end

  def about
  	
  end

  def help
  	
  end

end
