class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]
    

def new
    @user=User.new
end

def create
    @user=User.new(user_params)
    if @user.valid?
        @user.save
        session[:user_id]=@user.id
        redirect_to user_path(@user)
    else
        render "new"
    end
end

def show
    @user=User.find_by_id(params[:id])
end

def index
    @users=User.all
end

def destroy
    User.find_by_id(params[:id])
    redirect_to "/"
end


private 

def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin, :password)
end

def require_login
    if current_user.blank?
      redirect_to '/'
    end
  end

end

