class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create

    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user[:id]
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/"
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      render 'show'
    else
      redirect_to "/"
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin, :password)
    end

end

# it 'successfully signs up as admin' do
#   visit '/users/new'
#   expect(current_path).to eq('/users/new')
#   # admin_signup method is defined in login_helper.rb
#   admin_signup
#   expect(current_path).to eq('/users/1')
#   expect(page).to have_content("Walt Disney")
#   expect(page).to have_content("ADMIN")
# end


# {"utf8"=>"✓", "authenticity_token"=>"gcc9a8xYOfrtU3EcRnNKxNwu4FExmkZ+OfIGEFkkqKWp4Lfp15QGCeiJmLNu6z6KHla8P8u+vEoNQL9sMRJHVA==",
#   "user"=>{"name"=>"user3", "height"=>"33", "happiness"=>"3", "nausea"=>"3", "tickets"=>"33", "password"=>"user3", "admin"=>"1"}, "commit"=>"Create User", "controller"=>"users", "action"=>"create"} permitted
# : false>
