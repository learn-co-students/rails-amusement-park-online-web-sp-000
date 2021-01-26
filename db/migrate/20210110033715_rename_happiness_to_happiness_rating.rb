class RenameHappinessToHappinessRating < ActiveRecord::Migration[5.2]
  def change
    rename_column :attractions, :happiness, :happiness_rating
  end
end
