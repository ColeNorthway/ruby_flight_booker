class CreateAirports < ActiveRecord::Migration[8.1]
  def change
    create_table :airports do |t|
      t.string :city, null: false
      t.string :country, null: false
      t.string :name, null: false
      t.string :code, null: false

      t.timestamps
    end
  end
end
