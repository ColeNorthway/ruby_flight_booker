# Search
+ For the first screen, you will be creating 4 dropdown menus that will allow users to search for...
  + Available flights - departure airport, arrival airport, date, and number of passengers.
+ This requires relatively vanilla forms that happen to be prepopulated with collections of data.
+ Working with dates will cover a bit of new ground for you.

- [ ] Set up relations in database with migration cli commands
- [] Create an Airport model (which basically just needs an airport code like “SFO” or “NYC”) and use the db/seeds.rb file to create several airports.
- [ ] Create a Flight model (with the departure and arrival airport ids, start datetime and flight duration).
- [ ] Validate all uniq database entries and things that can be null
- [ ] Set up associations so you can ask Flight.first.departure_airport, Flight.first.arrival_airport and get back Airport objects.
  - [ ] Same for Airport.first.departing_flights and Airport.first.arriving_flights, which should return a list of Flight objects.
- [ ] Seed your database with flights.
- [ ] You will search and view results in the same page. Set up your FlightsController and routes to make the Index page (/flights) the root route.
- [ ] Create your search form on the /flights index page to submit using a GET (not POST) request back to the same URL.
- [ ] Add the four dropdown menus – a list of departure airports, arrival airports, number of passengers (1-4), and a date dropdown for the flight date.
  - [ ] The date dropdown should only include dates that have existing flights.
  - [ ] Don’t worry about restricting the contents of the airport dropdowns – you’d normally use JavaScript – so just allow the user to select any airport.
  - [ ] See this Stack Overflow post on formatting dates in dropdown lists, this short Stack Overflow post on selecting months/years and the Rails DateHelper API Docs for some help with creating Date selects. 

# Models CLI Creation
```bash
# Airports
bin/rails generate model Airport 'city:string!' 'country:string!' 'name:string!' 'code:string!'

# Flights
bin/rails generate model Flight 'departure_time:date!' 'arrival_time:date!' 'duration_minutes:integer!' 'delay_time_minutes:integer!'

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
# BASH ->  bin/rails generate migration ChangeTableFlights
add_foreign_key :flights, :airports, column: :source_airport
add_foreign_key :flights, :airports, column: :destination_airport

# Flight <-> Passenger

# PassengerProfile -> Passenger
# BASH -> bin/rails generate migration AddUsersRefToUserLoginData users:references:uniq
```