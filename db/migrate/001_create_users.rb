class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :name
      t.integer :tickets
      t.integer :nausea
      t.integer :happiness
      t.integer :height
    end
  end
end
