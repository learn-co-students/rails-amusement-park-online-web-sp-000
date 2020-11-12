class SessionsController < ApplicationController

    def new
        @user = User.new
        @users = User.all
      render 'sessions/new'
    end

    def create
        if params[:user_name] != nil
            @user = User.find_by(name: params[:user_name])
            return redirect_to '/signin' unless @user.authenticate(params[:user_password])
            if  params[:user_name].empty?  
                 params[:user_name]
                 redirect_to '/login'
            else
                 session[:user_id] = @user.id
                 redirect_to user_path(@user)
            end
        else
           params[:name]  
              redirect_to '/login'
        end  
    end
    

    def destroy
        session.clear
        redirect_to '/'
    end
end