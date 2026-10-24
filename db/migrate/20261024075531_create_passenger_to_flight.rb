class CreatePassengerToFlight < ActiveRecord::Migration[8.1]
  def change
    create_join_table :passengers, :flights do |t|
      t.index :flight_id
      t.index :passenger_id
    end
  end
end
