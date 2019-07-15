class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def index
      @users = User.all 
    end
  
    def create
        
        @user = User.create(user_params)
        #binding.pry
        if @user.valid?
          session[:user_id]=@user.id
          redirect_to @user
        else
          render :new
        end
    end

    def show
      if logged_in?
        @user = User.find(params[:id])
      else
        flash.now[:danger] = 'Must login first'
        redirect_to root_path
      end
    end

    private
      def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
      end
  end