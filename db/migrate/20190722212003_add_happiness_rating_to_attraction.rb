class AddHappinessRatingToAttraction < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :happiness_rating, :integer
  end
end
