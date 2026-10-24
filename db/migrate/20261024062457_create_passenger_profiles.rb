class CreatePassengerProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :passenger_profiles do |t|
      t.date :dob, null: false
      t.string :ssn, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.boolean :gender, null: false

      t.timestamps
    end
  end
end
