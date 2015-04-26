class ChallengesController < ApplicationController

  def new
    @challenge = Challenge.new
  end

  def show
    @challenge = Challenge.find(params[:id])
    @solution = params[:solution].to_s.gsub(/\s+/, '')
    @result = nil
    if @challenge.answer == @solution
      @result = "Congratulations, you are incredibly smart!"
    else
      @result = "Whoops, looks like your solution is a little off..."
    end

  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def create
  	@challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
  	if @challenge.save
  		redirect_to current_user
  	else
      flash[:alert] = @challenge.errors.full_messages
  		render "new"
  	end
  end

  def update
    @challenge = Challenge.find(params[:id])
    if @challenge.update_attributes(challenge_params)
      redirect_to current_user
    else
      flash[:alert] = @challenge.errors.full_messages
      render "edit"
    end
  end

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
