class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :tickets
      t.integer :mood, limit: 5
      t.integer :height
      t.integer :nausea
      t.integer :happiness
      t.boolean :admin, default: false
    end
  end
end
