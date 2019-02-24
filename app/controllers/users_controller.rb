class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    # return redirect_to controller: 'users', action: 'new' unless @user.save
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end


  private

    def user_params
      params.require(:user).permit(
        :name,
        :password,
        :height,
        :tickets,
        :happiness,
        :nausea,
        :admin
      )
    end

    def set_user
      @user = User.find(params[:id])
    end
end
