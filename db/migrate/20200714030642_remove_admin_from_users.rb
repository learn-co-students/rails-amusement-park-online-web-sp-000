class RemoveAdminFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :field_name, :boolean
  end
end
