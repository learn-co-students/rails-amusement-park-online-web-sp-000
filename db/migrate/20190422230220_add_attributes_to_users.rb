class AddAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password, :string
    add_column :users, :nausea, :integer
    add_column :users, :happiness, :integer
  end
end
