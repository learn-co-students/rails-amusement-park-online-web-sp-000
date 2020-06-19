class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :name
      t.integer :height
      t.integer :happiness
      t.integer :nausea
      t.integer :tickets
      t.boolean :admin, default: false
      t.string :password_digest
      t.timestamps null: false
    end
  end
end