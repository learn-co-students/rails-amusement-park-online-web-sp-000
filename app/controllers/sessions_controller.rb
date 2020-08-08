class SessionsController < ApplicationController 

    def create 
        raise params.inspect
    end

    def new 
        @user = User.new
    end

    def destroy
    end

end