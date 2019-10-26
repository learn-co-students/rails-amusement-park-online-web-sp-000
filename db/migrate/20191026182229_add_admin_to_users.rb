class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    def change
     add_column :users, :admin, :boolean, default: false
   end
  end
end
