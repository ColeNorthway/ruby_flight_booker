class AddDestinationAirportToFlights < ActiveRecord::Migration[8.1]
  def change
    add_column :flights, :destination_airport, :string, null: false
  end
end
