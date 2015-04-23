class UsersController < ApplicationController
	# If user is logged in, disable all methods except for new and create
	before_action :require_user, except: [:new, :create]

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id.to_s
			flash[:success] = "You've successfully created an account"
			redirect_to '/'
		else
			flash[:alert] = @user.errors.full_messages
			render 'new'
		end
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
