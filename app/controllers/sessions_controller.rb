class SessionsController < ApplicationController
  def new
    @user = User.new
    @user = User.all
  end
end
