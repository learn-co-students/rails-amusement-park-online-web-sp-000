class StaticController < ApplicationController
    skip_before_action :verify_authenticated, only: [:home]

    def home  
    end
end