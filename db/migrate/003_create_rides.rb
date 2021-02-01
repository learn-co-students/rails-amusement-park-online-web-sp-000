class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.belongs_to :user
      t.belongs_to :attraction

      t.timestamps
    end
  end
end
