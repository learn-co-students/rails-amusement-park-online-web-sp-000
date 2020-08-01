class SessionsController < ApplicationController

   def new
      
   end 

   def create 
      # byebug
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id 
         redirect_to user_path(@user)
      else 
         render 'new'
      end  
   end 

   def destroy 
   end 
end