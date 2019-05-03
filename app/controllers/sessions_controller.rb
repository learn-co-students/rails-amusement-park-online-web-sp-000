class SessionsController < ApplicationController
	include UsersHelper

	def signin
		@users = User.all
	end
	
	def create
		user = User.find_by(name: params[:user_name])
		if user && user.authenticate(params[:password])
			session[:user_id] = User.find_by(name: params[:user_name]).id
			redirect_to user_path(user)
		else 
			redirect_to '/signin'
		end
	end

	def signout
		if logged_in?
			session.clear
			redirect_to '/'
		end
  end
end
