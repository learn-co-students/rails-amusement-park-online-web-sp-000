class UsersController < ApplicationController

  def index
    @users = User.all
  end

    def new
      @user = User.new
    end

    def create
     #create a new user and assign session if valid
      @user = User.create(user_params)
      return redirect_to controller: 'users', action: 'new' unless @user.save
      session[:user_id] = @user.id
      if user_params[:admin] == true
        @user.admin = true
      end
      @user.save
      redirect_to @user
    end


    def show
      if !current_user
        redirect_to controller: 'users', action: 'new'
      else
        @user = User.find_by(id: params[:id])
      end
    end

    def destroy
      session.clear
      redirect_to root_path
    end


    private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end
end
