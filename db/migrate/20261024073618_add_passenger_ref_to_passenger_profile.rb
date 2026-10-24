class AddPassengerRefToPassengerProfile < ActiveRecord::Migration[8.1]
  def change
    add_reference :passenger_profiles, :passenger, index: {unique: true}, null: false, foreign_key: true
  end
end
