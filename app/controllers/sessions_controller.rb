class SessionsController < ApplicationController
	def new		
		@user
	end

	def create
		user = User.find_by_username(params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			flash[:alert] = "Incorrect username or password"
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

end
