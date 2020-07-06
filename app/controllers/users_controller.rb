require 'pry'
class UsersController < ApplicationController

    def index
        @user = User.all
    end 

    def new 
        @user = User.new
    end 

    def create
        uesr = User.create(post_params)
        redirect_to user
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
