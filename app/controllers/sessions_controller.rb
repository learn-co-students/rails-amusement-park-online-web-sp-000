class SessionsController < ApplicationController

    def new
        

    end

    def create
        #binding.pry
        @user = User.find_by(id: params[:user][:name])
        #binding.pry
        if @user && @user.authenticate(params[:password])

            session[:user_id] = @user.id
            redirect_to user_path(@user)

        else
            redirect_to "/signin"
        end
    end

    def destroy
        session.delete :user_id
        redirect_to "/"
    end


    private

    
end
