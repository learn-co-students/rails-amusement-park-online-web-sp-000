require 'pry'
class UsersController < ApplicationController

    def index
        @user = User.all
    end 

    def new 
        @user = User.new
    end 

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user
        else 
            render :new
        end 
      end
    

      def show
        @user = User.find(params[:id])
      end

    def edit

    end 

    def update
        
    end 

    def destroy

    end
    
    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

end
