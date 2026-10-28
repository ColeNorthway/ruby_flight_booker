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

  def map_all_attrib_arr(*attrib_maps)
    attrib_maps.map do |a|
      attrib_arr_to_map(a)
    end
  end

  def attrib_arr_to_map(attrib_arr)
    attrib_index = 0
    index_index = 1
    attrib_arr.map do |a|
      { a[index_index] => a[attrib_index] }
    end
  end
end
