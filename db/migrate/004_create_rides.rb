class CreateRides < ActiveRecord::Migration[4.2]
    def change
      create_table :rides do |t|
        t.string :user_id
        t.string :attraction_id
        
        t.timestamps null: false
      end
    end
  end