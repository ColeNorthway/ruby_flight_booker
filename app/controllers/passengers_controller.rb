class PassengersController < ApplicationController
  def new
    @passenger = Passenger.new
  end

  def create
    user = Passenger.new(passenger_params)
    user.create_passenger_profile(PassengerProfile.new(passenger_profile_params))
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome to Cole's Flights #{user.username}!"
      redirect_to flights_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def passenger_params
    params.expect(user: [ :username, :password, :email, :password_confirmation ])
  end

  def passenger_profile_params
    unless params[:passenger_profile][:gender].nil?
      if params[:passenger_profile][:gender] == "true"
        params[:passenger_profile][:gender] = true
      else
        params[:passenger_profile][:gender] = false
      end
    end
    params.expect(passenger_profile: [ :first_name, :last_name, :gender, :dob, :ssn ])
  end
end
