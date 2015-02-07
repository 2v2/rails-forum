class SessionController < ApplicationController
	def new
		render :new
	end

	def create
		user = User.find_by(screen_name: params[:screen_name])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/topics'
		else
			render :new
		end
	end

	def destroy 
		reset_session
		redirect_to 'login'
	end
end