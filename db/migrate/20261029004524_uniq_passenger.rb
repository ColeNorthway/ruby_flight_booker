class UniqPassenger < ActiveRecord::Migration[8.1]
  def change
    add_index :passengers, :username, unique: true
    add_index :passengers, :email, unique: true
  end
end
