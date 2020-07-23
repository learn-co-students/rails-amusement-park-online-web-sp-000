class UsersController < ApplicationController

	def index

	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		session[:user_id] = @user.id
		redirect_to user_path(@user)
	end

	def show
		require_logged_in
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
	end
end
