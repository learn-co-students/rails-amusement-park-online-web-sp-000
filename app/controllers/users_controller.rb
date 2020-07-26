class UsersController < ApplicationController


	def welcome
	end

	def new
		@user = User.new
	end

	def show
		if logged_in?
			@user = User.find_by_id(params[:id])
		else
			redirect_to root_path
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to root_path
		end	
	end

	def edit
		@user = User.find_by_id(params[:id])
	end

	def update
		@user = User.find_by_id(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user)
	end

	def destroy
		@user.destroy
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
	end

	def require_login
		return head(:forbidden) unless session.include? :id
	end

end
