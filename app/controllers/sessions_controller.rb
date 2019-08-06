class SessionsController < ApplicationController
  #skip_before_action :redirect_if_not_logged_in, only: [:new,:create]
    def new
     
    end 

 
    def create
      if @user = User.find_by(name:params[:user][:name])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'new'
      end
    end 
  
  
    #   def create
  #       @user = User.find_by(name: params[:user][:name])     
  #     if @user && @user.authenticate(params[:user][:password])
        
  #       session[:user_id] = @user.id
        
  #       redirect_to user_path(@user.id)
  #     else
  #        flash[:message] = "Sorry, please try again"
  #        redirect_to signin_path
  #     end
  #  end 
  

  def logout
    session.delete :user_id
    redirect_to root_path
  end

      private 

        def user_params(*args)
            params.require(:user).permit(*args)
        end



end 