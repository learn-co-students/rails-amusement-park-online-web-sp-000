class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end



  def create
    @user = User.find_by(name: params[:user][:name])
#    binding.pry
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end




  def destroy
    session.delete :user_id
    redirect_to root_path

  end


  private

    def pass_params
      params.require(:user).permit(:password)
    end

end
