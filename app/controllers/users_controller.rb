class UsersController < ApplicationController
  include UsersHelper
#  before_action :require_login
#	skip_before_action :require_login, only: [:new, :create]

    def show
      @user = User.find(params[:id])
      @attractions = Attraction.all
    end

    def new
      @user = User.new
    end

    def create
    			@user = User.new(user_params)
    			if @user.save
            log_in @user
            redirect_to @user
    			else
    					redirect_to '/'
    			end
    	end




    private

      def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
      end

#      def require_login
#    redirect_to root_path unless session.include? :user_id
#    end
end
