class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(params_user)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            redirect_to signup_path
        end

    end

    def show
        if current_user

            @mood = current_user.mood
            render 'show'
        else
            flash[:error] = 'Cannot find user'
            redirect_to '/'
        end

    end


  

    private
    def params_user
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end
