class ChangeUsersAdmin < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.up {t.change :admin, :boolean, default: false}
        dir.down {t.change :admin, :boolean}
      end
    end
  end
end
