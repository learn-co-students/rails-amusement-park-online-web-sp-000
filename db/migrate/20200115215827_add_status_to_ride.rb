class AddStatusToRide < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :status, :string
  end
end
