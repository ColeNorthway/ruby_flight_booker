class CreateFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :flights do |t|
      t.date :departure_time, null: false
      t.date :arrival_time, null: false
      t.integer :duration_minutes, null: false
      t.integer :delay_time_minutes, null: false

      t.timestamps
    end
  end
end
