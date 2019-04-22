class RemoveAttributesFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password_digest, :string
    remove_column :users, :nausea, :string
    remove_column :users, :happiness, :string
  end
end
