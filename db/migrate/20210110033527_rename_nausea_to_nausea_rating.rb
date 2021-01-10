class RenameNauseaToNauseaRating < ActiveRecord::Migration[5.2]
  def change
    rename_column :attractions, :nausea, :nausea_rating
  end
end
