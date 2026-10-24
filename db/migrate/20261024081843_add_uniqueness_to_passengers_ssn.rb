class AddUniquenessToPassengersSsn < ActiveRecord::Migration[8.1]
  def change
    add_index :passenger_profiles, :ssn, unique: true
  end
end
