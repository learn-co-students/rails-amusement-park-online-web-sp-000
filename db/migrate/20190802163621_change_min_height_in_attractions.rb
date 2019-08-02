class ChangeMinHeightInAttractions < ActiveRecord::Migration[5.2] 
  def change
    change_column :attractions, :min_height, :integer
  end
end
