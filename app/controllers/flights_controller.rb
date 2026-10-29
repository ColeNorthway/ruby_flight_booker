class FlightsController < ApplicationController
  before_action :users_flights
  skip_before_action :authenticate

  def index
    @source_cities = Flight.all.map { |f|
      [ f.source_port.city, f.source_port.id ]
    }.uniq!
    @dest_cities = Flight.all.map { |f|
      [ f.dest_port.city, f.dest_port.id ]
    }.uniq!
    @departure_dates = Flight.all.map { |f|
      [ f.departure_time ]
    }.uniq!
    @departure_dates = @departure_dates.each_with_index { |dd, i|
      dd << i
    }
    @arrival_dates = Flight.all.map { |f|
      [ f.arrival_time ]
    }.uniq!
    @arrival_dates = @arrival_dates.each_with_index { |ad, i|
      ad << i
    }
    make_default_options([ @source_cities, @dest_cities, @departure_dates, @arrival_dates ])

    @flights = Flight.search(
      params,
      map_all_attrib_arr(
        @source_cities,
        @dest_cities,
        @departure_dates,
        @arrival_dates
      )
    )
  end

  def show
    @flight = Flight.find(params[:id])
  end

  private

  def make_default_options(params)
    params.map! do |p|
      p.unshift([ "", -1 ])
    end
  end

  def map_all_attrib_arr(source_cities, dest_cities, departure_dates, arrival_dates)
    {
      source_cities: attrib_arr_to_map(source_cities),
      dest_cities: attrib_arr_to_map(dest_cities),
      departure_dates: attrib_arr_to_map(departure_dates),
      arrival_dates: attrib_arr_to_map(arrival_dates)
    }
  end

  def attrib_arr_to_map(attrib_arr)
    attrib_index = 0
    index_index = 1
    attrib_arr.reduce({}) do |map, a|
      map[a[index_index]] = a[attrib_index]
      map
    end
  end

  def users_flights
    return if unauth_empty_flights

    user = Passenger.find_by(id: session[:passenger_id])
    @users_flights = [] and return if user.nil?
    @users_flights = user.flights
  end

  def unauth_empty_flights
    if @logged_in
      false
    else
      @users_flights = []
      true
    end
  end
end
