class UsersController < ApplicationController
	def signin
		# binding.pry
		@user = User.new
		@users = User.all
	end

	def login
		# binding.pry
		user = User.find_by(name: params[:user_name])

		if user.authenticate(params[:password])
			session[:user_id] = user.id

			redirect_to user
		end
	end

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)

		if user.valid? 
			user.save
			session[:user_id] = user.id

			redirect_to user
		else
			redirect_to new_user
		end
	end

	def show
		redirect_to root_url if !session[:user_id]

		@user = User.find(params[:id])
	end

	def logout
		if session[:user_id]
			session.delete :user_id
			redirect_to root_url
		end
	end


	private

	def user_params
		params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
	end
end
