class UsersController < ApplicationController
    before_action :logged_in?, except: [:new, :create]
    #before_action :clear_alert

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
          session[:user_id] = user.id
          redirect_to user, alert: "Congrats! You're signed in."
          #redirect_to user_path(user)
        else
          render :new, alert: "Please fill in all fields."
        end
    end

    def show
    end

    def edit
    end

    def update
        # Remember: redirects incur a new page load.
        # When we redirect after validation failure, we lose the instance of @post that has feedback (messages for the user) in its errors attribute.
        if current_user.update(user_params)
            redirect_to current_user, alert: "Success. Updated user info."
        else
            render :edit, alert: "Please fill in all fields."
        end
    end
end