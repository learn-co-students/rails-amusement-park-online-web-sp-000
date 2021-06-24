# require 'pry'
class SessionsController < ApplicationController

    def new
        @user = User.new
        # byebug 
    end

    def create
        # binding.pry
        #  byebug
        if @user = User.find_by(name: params[:user][:name])
            # byebug
            if @user.authenticate(params[:user][:password])
               session[:user_id] = @user.id
               redirect_to users_show_path(@user)
            end
         end
    end

    def destroy
        if session[:user_id]
            session.destroy
            redirect_to root_path
        end
    end
end