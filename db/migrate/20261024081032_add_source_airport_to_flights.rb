class AddSourceAirportToFlights < ActiveRecord::Migration[8.1]
  def change
    add_column :flights, :source_airport, :string, null: false
  end
end
