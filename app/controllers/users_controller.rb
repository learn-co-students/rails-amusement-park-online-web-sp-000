class UsersController < ApplicationController
    def new
    end

    def create
        # binding.pry
        @user = User.create(user_params)
        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private 
    
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
    end
end
