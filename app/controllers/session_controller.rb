class SessionController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    # @user = User.find_by(name: par)
  end

  def destroy
    session.delete :user_id

    redirect_to root_path
  end
end
