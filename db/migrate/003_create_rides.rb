class CreateRides < ActiveRecord::Migration[5.0]
  def change
    create_table :rides do |t|
      t.belongs_to :attraction, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
