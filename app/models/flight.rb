class Flight < ApplicationRecord
  validates :source_airport, presence: true
  validates :destination_airport, presence: true
  validates :departure_time, presence: true
  validates :arrival_time, presence: true
  validates :duration_minutes, presence: true
  validates :delay_time_minutes, presence: true

  has_and_belongs_to_many :passengers
  belongs_to :source_port, class_name: "Airport"
  belongs_to :dest_port, class_name: "Airport"
end
