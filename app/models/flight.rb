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

  def self.search(params, attrib_map)
    self.remap_args_to_int(params)

    if self.args_present?(params)
      # Mapping the index from drop-down to actual attribute value
      self.remap_args_to_attrib(params, attrib_map)

      # Using that attribute value to obtain entries
      flight_name_group = self.flight_name_filter(params)
      source_city_group = self.source_city_filter(params)
      dest_city_group = self.dest_city_filter(params)
      arrival_time_group = self.arrival_time_filter(params)
      departure_time_group = self.departure_time_filter(params)
      self.filter_groups(
        flight_name_group,
        source_city_group,
        dest_city_group,
        arrival_time_group,
        departure_time_group
      )
    else
      all
    end
  end

  private

  # ~~~FILTERS~~~

  def self.args_present?(params)
    return false if self.defaults?(params)
    return false if self.nilled?(params)
    true
  end

  def self.defaults?(params)
    if [ params[:source_city], params[:dest_city], params[:arrival_time], params[:departure_time] ].all?(-1)
      && params[:flight_name].empty?
      return true
    end
    false
  end

  def self.nilled?(params)
    if [ params[:source_city], params[:dest_city], params[:arrival_time], params[:departure_time], params[:flight_name] ].all?(nil)
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

  # ~~~MAPPING~~~

  def self.remap_args_to_attrib(params, attrib_map)
    params[:source_city]    = attrib_map[:source_cities][params[:source_city]]
    params[:dest_city]      = attrib_map[:dest_cities][params[:dest_city]]
    params[:arrival_time]   = attrib_map[:arrival_dates][params[:arrival_time]]
    params[:departure_time] = attrib_map[:departure_dates][params[:departure_time]]
  end

  # ~~~GROUPING~~~

  def self.flight_name_filter(params)
    return [] if params[:flight_name].nil?
                 || params[:flight_name].empty?

    joins(:source_port, :dest_port).where(
      "airports.city LIKE :q OR dest_ports_flights.city LIKE :q",
      q: "%#{params[:flight_name]}%"
    )
  end

  def self.source_city_filter(params)
    return [] if params[:source_city].nil?
                 || params[:source_city].empty?
    joins(:source_port).where(airports: { city: params[:source_city] }).distinct
  end

  def self.dest_city_filter(params)
    return [] if params[:dest_city].nil?
                 || params[:dest_city].empty?
    joins(:dest_port).where(airports: { city: params[:dest_city] }).distinct
  end

  def self.arrival_time_filter(params)
    return [] if params[:arrival_time].nil?
                 || params[:arrival_time] == ""
    where(arrival_time: params[:arrival_time])
  end

  def self.departure_time_filter(params)
    return [] if params[:departure_time].nil?
                  || params[:departure_time] == ""
    where(departure_time: params[:departure_time])
  end

  def self.filter_groups(*groups)
    groups.reject! { |arr| arr.empty? }
    groups.reduce([]) do |acc, arr_x|
      arr_x.each do |f|
        acc << f if groups.all? do |arr_y|
          arr_y.include?(f)
        end
      end
    end.uniq
  end
end
