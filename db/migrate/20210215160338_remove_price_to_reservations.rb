class RemovePriceToReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :price, :integer
  end
end
