class StaticPagesController < ApplicationController
  skip_beforre_action :verified_user, only: [home]
  def home
  end
end