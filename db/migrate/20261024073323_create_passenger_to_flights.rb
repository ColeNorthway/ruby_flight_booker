class CreatePassengerToFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :passenger_to_flights do |t|
      t.references :flight, null: false, foreign_key: true
      t.references :passenger, null: false, foreign_key: true

      t.timestamps
    end
  end
end
