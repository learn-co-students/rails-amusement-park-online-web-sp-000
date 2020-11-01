class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer "user_id"
      t.integer "ride_id"
    end
  end
end
