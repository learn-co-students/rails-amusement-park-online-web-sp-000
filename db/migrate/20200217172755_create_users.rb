class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :nausea, default: 5
      t.integer :happiness, default: 5
      t.integer :tickets, default: 10
      t.integer :height, default: 150
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
