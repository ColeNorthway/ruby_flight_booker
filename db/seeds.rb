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
# for key, value in AIRPORTS do
#   Airport.create(code: key, city: value[:city], country: value[:country], name: value[:name])
# end


















