class ChangeAttractionsColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :attractions, :happiness_integer, :happiness_rating
  end
end
