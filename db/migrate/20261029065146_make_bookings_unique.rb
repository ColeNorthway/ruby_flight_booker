class MakeBookingsUnique < ActiveRecord::Migration[8.1]
  def change
    add_index :flights_passengers, [ :passenger_id, :flight_id ], unique: true
  end
end
