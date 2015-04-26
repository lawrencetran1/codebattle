class ChallengesController < ApplicationController

  # Method to create a new challenge
  def new
    @challenge = Challenge.new
  end

  # Method to show challenge and calculate result
  def show
    @challenge = Challenge.find(params[:id])

    # strip white space from solution to compare to challenge.answer which has no whitespace
    @solution = params[:solution].to_s.gsub(/\s+/, '')
    @result = nil
    if @challenge.answer == @solution
      @result = "Congratulations, you are incredibly smart!"
    else
      @result = "Whoops, looks like your solution is a little off..."
    end

  end

  # Method to edit a challenge
  def edit
    @challenge = Challenge.find(params[:id])
  end

  # Method to create a challenge and redirect to user profile if successful
  def create
  	@challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
  	if @challenge.save
  		redirect_to current_user
  	else
      # Error messages if create method does not pass validations
      flash[:alert] = @challenge.errors.full_messages
  		render "new"
  	end
  end

  # Method to update challenge and redirect to user profile if successful
  def update
    @challenge = Challenge.find(params[:id])
    if @challenge.update_attributes(challenge_params)
      redirect_to current_user
    else
      # Error messages if update method does not pass validations
      flash[:alert] = @challenge.errors.full_messages
      render "edit"
    end
  end

  # Method to delete challenge and redirect to user profile
  def destroy
    challenge = Challenge.find(params[:id])
    challenge.destroy
    redirect_to current_user
  end

  def check_solution
    # @challenge = Challenge.find(params[:id])
    # @solution = params[:solution].to_s.gsub(/\s+/, '')
    # @result = nil
    # if @challenge.answer == @solution
    #   @result = "Congratulations, you are incredibly smart!"
    #   redirect_to check_solution_path
    # else
    #   @result = "Whoops, looks like your solution is a little off..."
    #   redirect_to check_solution_path
    # end
  end

  private

    def challenge_params
      params.require(:challenge).permit(:name, :instructions, :category, :answer, :starter, :documentation)
    end

end
