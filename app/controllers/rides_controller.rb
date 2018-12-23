class RidesController < ApplicationController
  def new
    @user = User.find_by(id: params[:id])
    
  end
end

# <ActionController::Parameters {"controller"=>"users", "action"=>"show", "id"=>"1"} permitted: false>
