class SessionsController < ApplicationController

    def new
    end 

    def create
        byebug
        session[:name] = params[:name]
    
    end 

end 