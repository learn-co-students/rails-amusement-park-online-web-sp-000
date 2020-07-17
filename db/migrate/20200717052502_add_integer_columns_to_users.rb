class AddIntegerColumnsToUsers < ActiveRecord::Migration[5.2]
  # :nausea => 5,
  # :happiness => 3,
  # :tickets => 4,
  # :height => 34
  def change
    add_column :users, :nausea, :integer 
    add_column :users, :happiness, :integer 
    add_column :users, :tickets, :integer 
    add_column :users, :height, :integer 
  end
end
