class RemoveColumnsFromAttractions < ActiveRecord::Migration[5.2]
  def change
    remove_column :attractions, :ticket_number, :string
    remove_column :attractions, :integer, :string
  end
end
