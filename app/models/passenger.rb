class Passenger < ApplicationRecord
  has_secure_password
  validates_associated :passenger_profile, uniqueness: true, required: true
  validates_associated :flights

  has_one :passenger_profile, dependent: :destroy, required: true
  has_and_belongs_to_many :flights
end
