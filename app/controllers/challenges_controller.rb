class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
  	@challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
  	if @challenge.save
  		redirect_to current_user
  	else
  		render "new"
  	end
  end

  private

    def challenge_params
      params.require(:challenge).permit(:name, :instructions, :example, :category, :documentation)
    end

end
