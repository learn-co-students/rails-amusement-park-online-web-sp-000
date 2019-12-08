class SessionsController < ApplicationController

    def new
    end 

    def create
        session[:name] = params[:name]
    
    end 

end 