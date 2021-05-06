class UsersController < ApplicationController

    def index
    end

    def new
        @user = User.new
    end

    def create
        create_standard_and_admin_user
    end

    def signin
    end

    def verify_signin
        @user = User.find_by(name: params[:user][:name])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        if session[:user_id]
            @user = User.find_by_id(session[:user_id])
        else
            redirect_to "/"
        end
    end

    def destroy
        session.clear
        redirect_to "/"
    end

    private

    def user_params(*args)
        params.require(:user).permit(*args)
    end

    def create_standard_user
        @user = User.new(user_params(:name, :height, :happiness, :nausea, :tickets, :password, :admin))
         if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end
    
    def create_standard_and_admin_user
        if params[:user][:admin] != true
            create_standard_user
        else
            raise params.inspect
            @user = User.new(user_params(:name, :passowrd))
            @user.save
            @user.update_attribute :admin, true
            p @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
     end
end