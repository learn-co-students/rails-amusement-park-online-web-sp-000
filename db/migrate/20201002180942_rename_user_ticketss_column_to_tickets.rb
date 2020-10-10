class RenameUserTicketssColumnToTickets < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :ticketss, :tickets
  end
end

