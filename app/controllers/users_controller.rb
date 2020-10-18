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
            render 'new'
        end

    end

    def show
        if current_user
            render 'show'
        else
            flash[:error] = 'Cannot find user'
        end

    end

    def destroy

    end

    private
    def params_user
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end
