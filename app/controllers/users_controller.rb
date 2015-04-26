class UsersController < ApplicationController
	# If user is logged in, disable all methods except for new and create
	before_action :require_user, except: [:new, :create]

	# Method to create a new user
	def new
		@user = User.new
	end

	# Method to edit user profile
	def edit
		@user = User.find(params[:id])
	end

	# Method to update user profile, redirects to user profile if successful
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to current_user
    else
    	# Error messages if update does not pass validations
      flash[:alert] = @user.errors.full_messages
      render "edit"
    end
  end	

  # Creates an array of challenges that has 4 challenges per page
	def show
		@paginatable_array = Kaminari.paginate_array(current_user.challenges).page(params[:page]).per(4)
	end

	# Creates a new user and redirects to root if successful
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id.to_s
			redirect_to '/'
		else
			# Error messages if user tries to create a new user that does not pass validations
			flash[:alert] = @user.errors.full_messages
			render 'new'
		end
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
