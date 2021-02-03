class UsersController < ApplicationController
    skip_before_action :has_access, only: [:new, :create]

    def new

    end

    def create
        if user = User.create(user_params) 
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render 'new'
        end
    end

    def show
        @user = User.find_by(id: params[:id])
      end

    private

    def user_params
        params.require(:user).permit(:name, :height, :nausea, :tickets, :admin, :happiness, :password, :password_confirmation)
    end
end
