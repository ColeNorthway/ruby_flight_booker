class ChangeColNull < ActiveRecord::Migration[8.1]
  def change
    change_column_null :passenger_profiles, :ssn, false
    change_column_null :airports, :code, false
  end
end
