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

  def self.search(params)
    self.remap_args_to_int(params)

    if self.args_present?(params)
      joins(:source_port, :dest_port).where(
        "airports.city LIKE :q OR dest_ports_flights.city LIKE :q",
        q: "%#{params[:flight_name]}%"
      )
    else
      all
    end
  end

  private

  def self.args_present?(params)
    return false if self.defaults?(params)
    true
  end

  def self.defaults?(params)
    if [ params[:source_city], params[:dest_city], params[:arrival_time], params[:departure_time] ].all?(-1)
      && params[:flight_name].empty?
      return true
    end
    false
  end

  def self.remap_args_to_int(params)
    params[:source_city] = params[:source_city].to_i unless params[:source_city].nil?
    params[:dest_city] = params[:dest_city].to_i unless params[:dest_city].nil?
    params[:arrival_time] = params[:arrival_time].to_i unless params[:arrival_time].nil?
    params[:departure_time] = params[:departure_time].to_i unless params[:departure_time].nil?
  end
end
