class PassengerToFlight < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger
end
