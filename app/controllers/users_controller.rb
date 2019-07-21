class UsersController < ApplicationController

    def new
        @user = User.new
    end
    


    def create
        user = User.new(user_params)
        if user.save
            #log user in 
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            render :new #=> renders '/users/new' view to go to signup page
        end 
    end

    private 

    # fill_in("user[name]", :with => "Amy Poehler")
    # fill_in("user[height]", :with => "58")
    # fill_in("user[happiness]", :with => "3")
    # fill_in("user[nausea]", :with => "2")
    # fill_in("user[tickets]", :with => "15")
    # fill_in("user[password]", :with => "password")
    # click_button('Create User')

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end 
    
end
