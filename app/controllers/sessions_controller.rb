class SessionsController < ApplicationController

    def new
      @user = User.new
    end

    def create
        if params[:name].nil? || params[:name] == ""
            redirect_to '/sessions/new'
        elsif params[:password].nil? || params[:password] == ""
            redirect_to '/sessions/new'
        else 
            @user = User.find(user_params)
            session[:user_id] = @user.id
            if @user.admin == true
              render '/admin/index'
            else 
              render '/users/show'
            end
        end
      end


      def destroy
        User.find(session[:user_id]).destroy      
        session[:user_id] = nil         
        redirect_to '/' 
      end

    private

      def user_params
        params.require(:user).permit(:name, :password)
    end

end
