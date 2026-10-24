class Passenger < ApplicationRecord
  has_one :passenger_profile, dependent: :destroy, required: true
  has_and_belongs_to_many :flights
end
