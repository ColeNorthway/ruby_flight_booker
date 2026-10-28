class FlightsController < ApplicationController
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

    @flights = Flight.search(params)
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

  def process_search_params(source_cities, dest_cities, arrival_times, departure_times)
    {
      flight_name: params[:flight_name],
      source_city: params[:source_city],
      dest_city: params[:dest_city],
      departure_date: params[:arrival_time],
      arrival_date: params[:departure_time]
    }
  end

  def map_param_to_val()

  end
end
