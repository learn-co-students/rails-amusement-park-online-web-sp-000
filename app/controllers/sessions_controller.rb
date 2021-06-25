# require 'pry'
class SessionsController < ApplicationController

    def new
        @user = User.new
        # byebug 
    end

    def create
        # byebug
        if @user = User.find_by(name: params[:user][:name])
            # byebug
            # if @user.authenticate(params[:user][:password])
               session[:user_id] = @user.id
               redirect_to users_show_path(@user)
            # end
        end
        # if @user = User.find_by(id: params[:user][:name])
        #     # byebug
        #     session[:user_id] = @user.id
        #     redirect_to users_show_path(@user)
        # else
        #     render :new
        # end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end