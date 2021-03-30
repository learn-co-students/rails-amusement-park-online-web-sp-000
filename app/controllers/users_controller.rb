require 'pry'
class UsersController < ApplicationController

    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user), :alert => "You Just Signed Up"
      else
        render 'new', :alert => "Please Fill In All Forms"
      end
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(@user), :alert => "You Just Updated Your User Account"
      else
        render 'edit', :alert => "Please Fill In All Forms"
      end
    end
  
    def ride
        # binding.pry
      @ride = Ride.create(user_id: current_user.id,
      attraction_id: params[:format])
        # binding.pry
        # flash[:alert] = Ride.create(user_id: current_user.id, attraction_id: params[:format]).take_ride
    #   binding.pry
        @msg = @ride.take_ride
      redirect_to user_path(@ride.user, :msg => @msg)
    end
  
    def show
        @msg = params[:msg] if params[:msg]
        @msg ||= false
      @user = User.find(params[:id])

    end

    def login
        user = User.find_by(name: params[:user][:name])
        
        if user
          session[:user_id] = user.id
          redirect_to user_path(user)
        else
          redirect_to signin_path
        end
      end
    
      def logout
        session.delete(:user_id)
        redirect_to root_path
      end
  
    private
  
      def user_params
        params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
      end

      def ride_params
        params.permit(:user_id, :attraction_id)
      end
  
  end