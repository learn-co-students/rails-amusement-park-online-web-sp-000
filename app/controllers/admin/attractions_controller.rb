class Admin::AttractionsController < ApplicationController
  before_action :redirect_if_not_admin

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  private

  def redirect_if_not_admin
    @user = User.find(session[:user_id])
    if !@user.admin
      flash[:message] = "You must be an administrator to view that page."
      redirect_to user_path(@user)
    end
  end
end
