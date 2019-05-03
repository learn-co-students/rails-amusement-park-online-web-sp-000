class UsersController < ApplicationController
	include UsersHelper

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save 
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else 
			redirect_to 'users/new'
		end
	end

	def show
		if logged_in? && admin || users_page?
			@user = current_user
		else
			redirect_to '/'
		end
	end

	def index
		@users = User.all
	end

	private
	def user_params
		params.require(:user).permit!
	end
end
