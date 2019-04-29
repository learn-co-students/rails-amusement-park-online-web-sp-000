class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    raise params.inspect
  end
end
