class SessionsController < ApplicationController
  #are these new and create methods used anywhere, or am I always using the new and create for user???
  before_action :require_logged_in, only: [:show]
  
  def new
      @user = User.new
    end

    def create #create a new session
        #if params[:name].nil? || params[:name] == ""
         #   redirect_to '/sessions/new'
        #elsif params[:password].nil? || params[:password] == ""
         #   redirect_to '/sessions/new'
        #else 
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:password])    
          session[:user_id] = @user.id
            if @user.admin == true
              render '/admin/show'
            else 
              redirect_to user_path(@user)
            end
          else 
            redirect_to '/'
          end
      end


      def destroy
        User.find(session[:user_id]).destroy      
        session[:user_id] = nil         
        redirect_to '/' 
      end

    private

      def user_params
        params.require(:user).permit(:name, :password)
    end

end
