class ChangeRideIdToAttractionIdonRides < ActiveRecord::Migration[5.2]
  def change
    rename_column :rides, :ride_id, :attraction_id
  end
end
