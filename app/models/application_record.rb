class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def current_user
    User.find(session[:user_id])
  end
end
