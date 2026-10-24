# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# AIRPORTS = {
#   LAX: {
#     name: "Los Angeles International Airport",
#     city: "Los Angeles",
#     country: "United States"
#   },
#   JFK: {
#     name: "John F. Kennedy International Airport",
#     city: "New York",
#     country: "United States"
#   },
#   LHR: {
#     name: "Heathrow Airport",
#     city: "London",
#     country: "United Kingdom"
#   },
#   HND: {
#     name: "Tokyo International Airport",
#     city: "Tokyo",
#     country: "Japan"
#   },
#   CDG: {
#     name: "Paris Charles de Gaulle Airport",
#     city: "Paris",
#     country: "France"
#   },
#   DXB: {
#     name: "Dubai International Airport",
#     city: "Dubai",
#     country: "United Arab Emirates"
#   },
#   SYD: {
#     name: "Sydney Kingsford Smith Airport",
#     city: "Sydney",
#     country: "Australia"
#   },
#   FRA: {
#     name: "Frankfurt Airport",
#     city: "Frankfurt",
#     country: "Germany"
#   },
#   YYZ: {
#     name: "Toronto Pearson International Airport",
#     city: "Toronto",
#     country: "Canada"
#   },
#   ORD: {
#     name: "O'Hare International Airport",
#     city: "Chicago",
#     country: "United States"
#   },
#   KIN: {
#     name: "Norman Manley International Airport",
#     city: "Kingston",
#     country: "Jamaica"
#   }
# }
#
# AIRPORTS.each { |key, value|
#   Airport.create(code: key, city: value[:city], country: value[:country], name: value[:name])
# }

FLIGHTS = [
  {
    pair: [ 4, 7 ],
    departure_time: "2026-10-24 08:00:00 -0500",
    arrival_time: "2026-10-24 09:30:00 -0500",
    duration: 90,
    delay: 0
  },
  {
    pair: [ 1, 11 ],
    departure_time: "2026-10-24 10:15:00 -0500",
    arrival_time: "2026-10-24 14:00:00 -0500",
    duration: 225,
    delay: 15
  },
  {
    pair: [ 9, 2 ],
    departure_time: "2026-10-24 06:45:00 -0500",
    arrival_time: "2026-10-24 08:10:00 -0500",
    duration: 85,
    delay: 0
  },
  {
    pair: [ 3, 8 ],
    departure_time: "2026-10-24 11:20:00 -0500",
    arrival_time: "2026-10-24 13:50:00 -0500",
    duration: 150,
    delay: 45
  },
  {
    pair: [ 11, 5 ],
    departure_time: "2026-10-24 14:00:00 -0500",
    arrival_time: "2026-10-24 15:45:00 -0500",
    duration: 105,
    delay: 0
  },
  {
    pair: [ 6, 3 ],
    departure_time: "2026-10-24 09:10:00 -0500",
    arrival_time: "2026-10-24 10:30:00 -0500",
    duration: 80,
    delay: 0
  },
  {
    pair: [ 2, 10 ],
    departure_time: "2026-10-24 16:30:00 -0500",
    arrival_time: "2026-10-24 20:00:00 -0500",
    duration: 210,
    delay: 120
  },
  {
    pair: [ 8, 1 ],
    departure_time: "2026-10-24 05:15:00 -0500",
    arrival_time: "2026-10-24 07:45:00 -0500",
    duration: 150,
    delay: 0
  },
  {
    pair: [ 10, 4 ],
    departure_time: "2026-10-24 13:40:00 -0500",
    arrival_time: "2026-10-24 16:20:00 -0500",
    duration: 160,
    delay: 0
  },
  {
    pair: [ 5, 9 ],
    departure_time: "2026-10-24 18:05:00 -0500",
    arrival_time: "2026-10-24 21:15:00 -0500",
    duration: 190,
    delay: 30
  },
  {
    pair: [ 7, 3 ],
    departure_time: "2026-10-24 07:30:00 -0500",
    arrival_time: "2026-10-24 09:05:00 -0500",
    duration: 95,
    delay: 0
  },
  {
    pair: [ 1, 5 ],
    departure_time: "2026-10-24 12:50:00 -0500",
    arrival_time: "2026-10-24 14:10:00 -0500",
    duration: 80,
    delay: 0
  },
  {
    pair: [ 11, 10 ],
    departure_time: "2026-10-24 15:25:00 -0500",
    arrival_time: "2026-10-24 18:55:00 -0500",
    duration: 210,
    delay: 0
  },
  {
    pair: [ 4, 2 ],
    departure_time: "2026-10-24 19:40:00 -0500",
    arrival_time: "2026-10-24 22:10:00 -0500",
    duration: 150,
    delay: 10
  },
  {
    pair: [ 9, 7 ],
    departure_time: "2026-10-24 08:55:00 -0500",
    arrival_time: "2026-10-24 11:40:00 -0500",
    duration: 165,
    delay: 0
  },
  {
    pair: [ 3, 10 ],
    departure_time: "2026-10-24 20:15:00 -0500",
    arrival_time: "2026-10-24 23:30:00 -0500",
    duration: 195,
    delay: 0
  },
  {
    pair: [ 8, 9 ],
    departure_time: "2026-10-24 06:20:00 -0500",
    arrival_time: "2026-10-24 08:50:00 -0500",
    duration: 150,
    delay: 0
  },
  {
    pair: [ 2, 6 ],
    departure_time: "2026-10-24 10:05:00 -0500",
    arrival_time: "2026-10-24 12:15:00 -0500",
    duration: 130,
    delay: 25
  },
  {
    pair: [ 10, 1 ],
    departure_time: "2026-10-24 14:50:00 -0500",
    arrival_time: "2026-10-24 17:35:00 -0500",
    duration: 165,
    delay: 0
  },
  {
    pair: [ 6, 11 ],
    departure_time: "2026-10-24 17:15:00 -0500",
    arrival_time: "2026-10-24 19:20:00 -0500",
    duration: 125,
    delay: 0
  },
  {
    pair: [ 5, 3 ],
    departure_time: "2026-10-24 21:00:00 -0500",
    arrival_time: "2026-10-24 23:45:00 -0500",
    duration: 165,
    delay: 0
  },
  {
    pair: [ 7, 9 ],
    departure_time: "2026-10-24 11:45:00 -0500",
    arrival_time: "2026-10-24 14:05:00 -0500",
    duration: 140,
    delay: 65
  },
  {
    pair: [ 11, 2 ],
    departure_time: "2026-10-24 05:40:00 -0500",
    arrival_time: "2026-10-24 09:10:00 -0500",
    duration: 210,
    delay: 0
  },
  {
    pair: [ 1, 8 ],
    departure_time: "2026-10-24 13:10:00 -0500",
    arrival_time: "2026-10-24 15:25:00 -0500",
    duration: 135,
    delay: 0
  },
  {
    pair: [ 4, 10 ],
    departure_time: "2026-10-24 16:55:00 -0500",
    arrival_time: "2026-10-24 20:15:00 -0500",
    duration: 200,
    delay: 0
  }
]


def print_errors(flight)
  if flight.errors.any?
    puts "Errors:"
    flight.errors.full_messages.each do |msg|
      puts "  - #{msg}"
    end
    puts ""
  end
end

FLIGHTS.each do |obj|
  flight = Flight.new
  flight.source_port = Airport.find(obj[:pair].first)
  flight.dest_port = Airport.find(obj[:pair].last)
  flight.departure_time = obj[:departure_time]
  flight.arrival_time = obj[:arrival_time]
  flight.duration_minutes = obj[:duration]
  flight.delay_time_minutes = obj[:delay]
  flight.save
  print_errors(flight)
end














