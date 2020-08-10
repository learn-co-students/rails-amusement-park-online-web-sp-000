class SessionsController < ApplicationController 

    def create 
        if @user = User.find_by(name: params[:user][:name])
            # @user = @user.try(:authenticate, params[:user][:password])

            # return redirect_to(controller: 'sessions', action: 'new') unless @user

            session[:user_id] = @user.id

            redirect_to user_path(@user)
        else
            render "new" 
        end
    end

    def new 
        @user = User.new
    end

    def destroy
        session.delete :user_id

        redirect_to '/'
    end


end