class PagesController < ApplicationController
  def index
  	@challenges = Challenge.all.page(params[:page])
  end

  def contact
  	
  end

  def about
  	
  end

  def help
  	
  end

end
