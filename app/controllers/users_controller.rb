class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        if @user.id == session[:user_id]
           @user
        else 
            redirect_to root_path
        end                                                                                                                                                                            
    end

    def signin
        
    end

    def login
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
            redirect_to '/users/signin'
        end
    end


    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :admin, :tickets, :password)
    end
end
