class AddReferencesToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :booking_type_id, :integer
  end
end
