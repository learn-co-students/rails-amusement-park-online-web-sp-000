class UsersController < ApplicationController
    before_action :logged_in?, only: [:show]

    def new
        @user = User.new
        # signup form
    end

    def create
        @user = User.create(user_params)
            if @user.save
            # byebug
            session[:user_id] = @user.id
            redirect_to users_show_path(@user)
        else
            redirect_to users_new_path
        end
    end

    def show
        #byebug
        @user = User.find_by(id: session[:user_id])
        #byebug
    end

    def destroy
        if session[:user_id]
            session.destroy
            redirect_to root_path
        end
    end
end