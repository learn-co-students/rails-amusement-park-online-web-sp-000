class CreatePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :preferences do |t|
      t.string :attraction_sort_order
      t.string :ride_sort_order
      t.boolean :allow_create_attractions
      t.boolean :allow_create_rides

      t.timestamps null: false
    end
  end
end