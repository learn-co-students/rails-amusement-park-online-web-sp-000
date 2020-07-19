class UsersController < ApplicationController
    def new
    end

    def create

        if params[:user][:name].present? && params[:user][:password].present? && params[:user][:admin] == "1"
            @user = User.create(name: params[:user][:name], password: params[:user][:password], admin: params[:user][:admin])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)             
        elsif params[:user][:name].present? && params[:user][:password].present?
            @user = User.create(user_params)
            session[:user_id] = @user.id 
            redirect_to user_path(@user)    
        else
            redirect_to controller: 'users', action: 'new'
        end      
    end

    def show
        if helpers.logged_in?
            @user = User.find_by(id: params[:id])
        else
            redirect_to :root
        end
    end

    def signin
    end

    def loggedin

        if params[:user][:name].present? && params[:password].present?
            user = User.find_by(params[:user][:name])
            if params[:password] == user.password
                binding.pry
                session[:user_id] = user.id 
                redirect_to user_path(user) 
            else
                redirect_to controller: 'users', action: 'signin'
            end 
        else
            redirect_to controller: 'users', action: 'signin'
        end
    end

    private
 
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end


end
