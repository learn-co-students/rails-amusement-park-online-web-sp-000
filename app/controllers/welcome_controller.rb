class WelcomeController < ApplicationController
    skip_before_action :has_access, only: [:home]

    def home
    end
end
