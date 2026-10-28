# Search
+ For the first screen, you will be creating 4 dropdown menus that will allow users to search for...
  + Available flights - departure airport, arrival airport, date, and number of passengers.
+ This requires relatively vanilla forms that happen to be prepopulated with collections of data.
+ Working with dates will cover a bit of new ground for you.

- [x] Set up relations in database with migration cli commands
- [x] Validate all uniq database entries and things that can be null
- [x] Create an Airport model (which basically just needs an airport code like “SFO” or “NYC”) and use the db/seeds.rb file to create several airports.
- [x] Create a Flight model (with the departure and arrival airport ids, start datetime and flight duration).
- [x] Flesh out associations in models
- [x] Flesh our required fields
- [x] Seed your database with flights.
- [x] Add a callback before save for flight that if the delay time is null make it 0
- [x] Install bcrypt gem and hash ssn
- [x] Add routes for flights
- [x] Set up your FlightsController and routes to make the Index page (/flights) the root route.
  - [x] Get the css right
  - [x] Get the spacing right
  - [x] Commit
- [x] Figure out how to calculate delay as part of the arrival time
- [x] Create your search form on the /flights index page to submit using a GET (not POST) request back to the same URL.
- [ ] Add the four dropdown menus
  - [ ] Dest
  - [ ] Source
  - [ ] Departure Time
  - [ ] Arrival Time
  - [ ] The date dropdown should only include dates that have existing flights.
  - [ ] Don’t worry about restricting the contents of the airport dropdowns – you’d normally use JavaScript – so just allow the user to select any airport.
  - [ ] See this Stack Overflow post on formatting dates in dropdown lists, this short Stack Overflow post on selecting months/years and the Rails DateHelper API Docs for some help with creating Date selects. 

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