class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :nausea
      t.integer :happiness
      t.integer :tickets
      t.integer :height
      t.boolean :admin, default: false
      t.string :password_digest

      t.timestamps
    end

    # change_column_default :users, :admin, false

  end
end
