class SessionsController < ApplicationController
    def new
    
    end

    def create
        # user = User.find_by(name: params[:user_name])
        # authenticated = user.try(:authenticate, params[:password])
        # return head(:forbidden) unless authenticated
        # @user = user
        # session[:user_id] = @user.id
        # redirect_to user_path(@user)

        user = User.find(params[:user_name])

        user = user.try(:authenticate, params[:password])

        return redirect_to(controller: 'sessions', action: 'new') unless user

        session[:user_id] = user.id

        @user = user

        redirect_to user_path(@user)
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end