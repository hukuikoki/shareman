class AddColumnToReservation < ActiveRecord::Migration[4.2][5.1]
  def change
    add_column :reservations, :self_booking, :boolean
  end
end
