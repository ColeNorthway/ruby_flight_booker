class PassengersController < ApplicationController
  skip_before_action :authenticate, only: [ :new, :create ]

  def new
    @passenger = Passenger.new
    @passenger.build_passenger_profile
  end

  def create
    @passenger = Passenger.build(passenger_params)
    if @passenger.save
      session[:passenger_id] = @passenger.id
      flash[:success] = "Welcome to Cole's Flights #{@passenger.username}!"
      redirect_to flights_path
    else
      @passenger.build_passenger_profile
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @passenger = Passenger.find_by(id: session[:passenger_id])
  end

  def update
    @passenger = Passenger.find_by(id: session[:passenger_id])

    if @passenger&.update(passenger_params)
      flash[:success] = "Successfully updated user profile"
      redirect_to flights_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def new_password
    @passenger = Passenger.find(session[:passenger_id])
  end

  def change_password
    @passenger = Passenger.find_by(id: session[:passenger_id])

    if @passenger&.update(password_params)
      flash[:success] = "Successfully changed password"
      redirect_to flights_path
    else
      render :new_password, status: :unprocessable_entity
    end
  end

  private

  def passenger_params
    params.expect(passenger: [
      :username, :password, :email, :password_confirmation, :password_challenge,
      passenger_profile_attributes: [ :first_name, :last_name, :gender, :dob, :ssn ]
    ])
  end

  def password_params
    params.expect(passenger: [ :password, :password_confirmation, :password_challenge ])
  end
end
