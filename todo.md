# Search
+ Ok next we will have to create a booking between a user and a flight
+ This requires a few things to be in place
  + User object to map with the flight
    + This requires a session and we need to get authentication before we even do this
  + Flight object to map with the user
    + This is literally the flight that we already have loaded!

- [ ] Set up basic authentication
  - [ ] We need to have a sign in
  - [ ] We need to have a log in
  - [ ] We need to have a log out
  - [ ] We need to have an edit profile button
  - [ ] Put everything in a flexbox with the title
    - [ ] Push the title to the left and the buttons to the right
- [ ] Set up button for selection on user
  - [ ] If the user isn't logged in we hide the book button
  - [ ] If the user isn't logged in we hide logout
  - [ ] If the user isn't logged in we hide edit profile
  - [ ] If the user isn't logged in we hide edit profile
  - [ ] If the user isn't logged in we will display *login to book!*

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