class DropPassengerToFlight < ActiveRecord::Migration[8.1]
  def change
    drop_table :passenger_to_flights
  end
end
