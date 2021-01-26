class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :min_height
      t.integer :nausea
      t.integer :happiness
      t.integer :tickets

      t.timestamps
    end
  end
end
