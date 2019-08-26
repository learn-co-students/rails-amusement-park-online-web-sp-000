class StaticController < ApplicationController
def index
end

def signin
end

def new
end

def create
  user = User.find_by(email: params[:user][:email].downcase)


  if user && user.authenticate(params[:user][:password])
    log_in user
    redirect_to user
  else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
  end
end

end
