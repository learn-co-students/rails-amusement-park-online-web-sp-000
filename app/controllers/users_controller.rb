class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

    def new
        @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(current_user.id)
      else
        render :new
      end
    end


    # it 'prevents user from viewing user show page and redirects to home page if not logged in' do
    #   create_standard_user
    #   visit '/users/1'
    #   expect(current_path).to eq('/')
    #   expect(page).to have_content("Sign Up")
    # end

  # def create_standard_user 
  #   @mindy = User.create(
  #     name: "Mindy",
  #     password: "password",
  #     happiness: 3,
  #     nausea: 2,
  #     tickets: 10,
  #     height: 50
  #     )
  # end

    def show
        @user = User.find_by(:id => params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end 
end
