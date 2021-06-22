class UsersController < ApplicationController

    def new
        # signup form
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to controller: 'users', action: 'show'
        else
            redirect_to controller: 'users', action: 'create'
        end
    end

    def show
        # byebug
        @user = User.find(params[:id])
        render template: 'users/show'
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end

end