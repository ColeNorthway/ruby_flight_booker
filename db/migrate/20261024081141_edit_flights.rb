class EditFlights < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key :flights, :airports, column: :source_airport
    add_foreign_key :flights, :airports, column: :destination_airport
  end
end
