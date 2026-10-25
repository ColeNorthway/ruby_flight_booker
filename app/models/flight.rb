class Flight < ApplicationRecord
  validates :departure_time, presence: true
  validates :arrival_time, presence: true
  validates :duration_minutes, presence: true
  validates :delay_time_minutes, presence: true

  validates_associated :source_port, required: true
  validates_associated :dest_port, required: true

  has_and_belongs_to_many :passengers
  belongs_to :source_port, class_name: "Airport", foreign_key: "source_airport"
  belongs_to :dest_port, class_name: "Airport", foreign_key: "destination_airport"

  before_save do |flight|
    flight.delay_time_minutes = 0 if  flight.delay_time_minutes.nil?
  end

  def self.search(search)
    if search.present?
      joins(:source_port, :dest_port).where(
        "airports.city LIKE :q OR dest_ports_flights.city LIKE :q",
        q: "%#{search}%"
      )
    else
      all
    end
  end
end
