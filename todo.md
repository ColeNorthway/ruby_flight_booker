# Search
+ For the first screen, you will be creating 4 dropdown menus that will allow users to search for...
  + Available flights - departure airport, arrival airport, date, and number of passengers.
+ This requires relatively vanilla forms that happen to be prepopulated with collections of data.
+ Working with dates will cover a bit of new ground for you.

- [ ] Set up button for selection on user

# Models CLI Creation
```bash
# Airports
bin/rails generate model Airport 'city:string!' 'country:string!' 'name:string!' 'code:string!'

# Flights
bin/rails generate model Flight 'departure_time:date!' 'arrival_time:date!' 'duration_minutes:integer!' 'delay_time_minutes:integer!'

# PassengerToFlight
bin/rails generate model FlightsPassengers flight:references passenger:references
# Rollback for primary key
#  - Run below
#  - Rerun above
#  - Edit primary key primary_key: [:passenger_id, :flight_id]

# Passenger
bin/rails generate model Passenger

# Passenger Profile
bin/rails generate model PassengerProfile 'dob:date!' 'ssn:string!' 'first_name:string!' 'last_name:string!' 'gender:boolean!'

# Payment Info
???
```

# References Migration Code
```ruby
# Flight -> Airport
# BASH -> bin/rails generate migration AddSourceAirportToFlights source_airport:string!
# BASH -> bin/rails generate migration AddDestinationAirportToFlights destination_airport:string!
# BASH ->  bin/rails generate migration ChangeTableFlights
add_foreign_key :flights, :airports, column: :source_airport
add_foreign_key :flights, :airports, column: :destination_airport

# Flight <-> Passenger
#  - BASH -> bin/rails generate model PassengerToFlight flight:references passenger:references
#  - This fucked up bc composite primary key
#  - Drop table -> rails generate migration DropPassengerToFlight
#  - Add table -> rails generate migration CreatePassengerToFlight
class CreatePassengerToFlight < ActiveRecord::Migration[8.1]
  def change
    create_join_table :passengers, :flights do |t|
      t.index :flight_id
      t.index :passenger_id
    end
  end
end


# PassengerProfile -> Passenger
# BASH -> bin/rails generate migration AddPassengerRefToPassengerProfile passenger:references:uniq
```

# Routes
1) First we need to add *flights*
   + Show flights, show a flight, no editing, no deleting, no creating
       + Only index and show
       + Add via `bin/rails generate controller Flights index show --skip-routes`