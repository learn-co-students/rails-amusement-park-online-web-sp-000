class SessionsController < ApplicationController

    def sign_in
        @user = User.new
    end 

    def create 
        if @user = User.find_by(name: params[:user][:name])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            render 'new'
          end
    end

    def destroy
        binding.pry
        # session.delete(:user_id)
    end 

    # private 
    def sessions_params
        params.require(:user).permit(:name, :height, :nausea, :tickets, :admin, :password, :happiness)
    end 
end
