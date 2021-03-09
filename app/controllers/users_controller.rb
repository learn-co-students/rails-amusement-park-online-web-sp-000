class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    user = User.new(user_params)
    if user && user.authenticate(params[:user][:password])
      if user.save
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end
  end

  def signin
    @users = User.all
  end

  def login

    user = User.find_by(id: params[:user][:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to '/'
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end


# <%= form_tag "/signin" do %>
#   <%= label_tag "User name" %>
#   <%= text_field_tag :user_name %><br>

#   <%= label_tag :password %>
#   <%= text_field_tag :password %><br>

#   <%= submit_tag "Login" %>
# <% end %>
