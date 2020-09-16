class CreateAdmin < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      add_column :users, :admin, :boolean, default: false
    end
  end
end
