class AddAttributesToUserTable < ActiveRecord::Migration[5.2]

  def change
    add_column :users, :nausea, :string
    add_column :users, :happiness, :string
    add_column :users, :tickets, :integer
    add_column :users, :height, :integer
    add_column :users, :admin, :boolean, :default => false
  end

end
