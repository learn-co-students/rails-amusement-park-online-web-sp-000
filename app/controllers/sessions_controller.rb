class SessionsController < ApplicationController

    def new
    end

    def create
        if params[:name].nil? || params[:name] == ""
            redirect_to '/sessions/new'
        elsif params[:password].nil? || params[:password] == ""
            redirect_to '/sessions/new'
        else 
            @user = User.find(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        end
      end
    
    private

      def user_params
        params.require(:user).permit(:name, :password)
    end

end
