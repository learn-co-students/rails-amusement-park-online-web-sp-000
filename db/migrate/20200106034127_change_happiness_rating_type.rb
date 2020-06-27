class ChangeHappinessRatingType < ActiveRecord::Migration[5.2]
  def change
    change_column :attractions, :happiness_rating, :integer
  end
end
