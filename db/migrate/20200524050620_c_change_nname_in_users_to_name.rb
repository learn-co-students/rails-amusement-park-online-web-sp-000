class CChangeNnameInUsersToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :nname, :name
  end
end
