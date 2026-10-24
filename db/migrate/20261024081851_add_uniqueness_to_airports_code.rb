class AddUniquenessToAirportsCode < ActiveRecord::Migration[8.1]
  def change
    add_index :airports, :code, unique: true
  end
end
