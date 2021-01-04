class RemoveMinHeightFromRides < ActiveRecord::Migration[5.2]
  def change
    remove_column :rides, :min_height, :integer
  end
end
