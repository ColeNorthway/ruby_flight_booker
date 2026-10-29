class AddUsersAndEmailToPassenger < ActiveRecord::Migration[8.1]
  def change
    add_column :passengers, :username, :string, null: false
    add_column :passengers, :email, :string, null: false
  end
end
