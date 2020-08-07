class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    # method for checking current_user
    def current_user(session)
      @user ||= User.find(session[:user_id])
    end

    # method for checking if a user is signed in
    def logged_in?
      !!session[:user_id]
      redirect_to '/'
    end

    # # grab all plants where the session[:gardener_id] == Plant.gardener_id
    # def self.my_plants(session)
    #   @gardener = Gardener.find(session[:gardener_id])
    #   @my_plants = @gardener.plants
    # end

  private

    def current_user
      User.find(session[:user_id])
    end
end
