class AddPasswordDigestToPassenger < ActiveRecord::Migration[8.1]
  def change
    add_column :passengers, :password_digest, :string, null: false
  end
end
