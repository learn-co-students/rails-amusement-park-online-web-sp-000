class UsersController < ApplicationController
    # before_action :require_login
    # skip_before_action :require_login, only: [:new, :signin, :create]

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

    def show
        if session[:user_id] != params[:id].to_i
            redirect_to '/'
        else
            @user = User.find_by(id: params[:id])
        end
    end

     def signin
         @user = User.new
     end

     def login
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
             redirect_to user_path(@user)
        else
            redirect_to :signin
        end
    end

     def logout
        session[:user_id] = nil
        redirect_to '/'
     end

private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def user_params
        params.require(:user).permit(:name, :password, :happiness, :tickets, :nausea, :height, :admin)
    end
end
