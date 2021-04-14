class UsersController < ApplicationController


    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render 'new'
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user.id == session[:user_id]
            render 'show'
        else
            redirect_to 'root'
        end
    end

    def logout
        session.destroy
        redirect_to 'root'
    end

    private

    def user_params
      params.require(:user).permit(:name, :password, :tickets, :mood, :height, :nausea, :happiness, :admin)
    end
end
