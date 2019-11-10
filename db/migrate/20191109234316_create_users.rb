class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name
      t.integer :height
      t.integer :nausea
      t.integer :happiness
      t.integer :tickets
      t.float :dollars

      t.timestamps
    end
  end
end
