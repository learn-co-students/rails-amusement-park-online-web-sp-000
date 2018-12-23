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

# describe 'Feature Test: User Signout', :type => :feature do

  # it 'redirects to home page after logging out' do
  #   visit '/users/new'
  #   # user_signup method is defined in login_helper.rb
  #   user_signup
  #   click_link("Log Out")
  #   expect(current_path).to eq('/')
  # end

  # it "successfully destroys session hash when 'Log Out' is clicked" do
  #   visit '/users/new'
  #   # user_signup method is defined in login_helper.rb
  #   user_signup
  #   click_link("Log Out")
  #   expect(page.get_rack_session).to_not include("user_id")
  # end
  #
  # it 'has a link to log out from the users/show page when user is an admin' do
  #   visit '/users/new'
  #   # admin_signup method is defined in login_helper.rb
  #   admin_signup
  #   expect(page).to have_content("Log Out")
  # end
