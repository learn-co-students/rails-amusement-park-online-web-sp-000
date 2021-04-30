class WelcomeController < ApplicationController
    skip_before_action :auth_user, only: [:home]
    def home

    end
end