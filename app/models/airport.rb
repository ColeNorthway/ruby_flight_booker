class Airport < ApplicationRecord
  has_many :arriving_flights, foreign_key: "source_airport", class_name: "Flight"
  has_many :departing_flights, foreign_key: "destination_airport", class_name: "Flight"
end
