class DropAttractions < ActiveRecord::Migration[5.2]
  def change
    drop_table :attractions do |t|
      t.string :name, null: false
      t.integer :min_height, null: false
      t.integer :nausea_rating, null: false
      t.integer :happiness_rating, null: false
      t.integer :ticket_number, null: false
    end
  end
end
