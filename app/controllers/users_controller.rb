class UsersController < ApplicationController
	# If user is logged in, disable all methods except for new and create
	before_action :require_user, except: [:new, :create]

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to current_user
    else
      flash[:alert] = @user.errors.full_messages
      render "edit"
    end
  end	

	def show
		@paginatable_array = Kaminari.paginate_array(current_user.challenges).page(params[:page]).per(4)
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id.to_s
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
