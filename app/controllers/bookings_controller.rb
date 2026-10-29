class BookingsController < ApplicationController
  def create
    get_user_and_flight

    @p&.flights << @f
    flash[:success] = "Thank you for choosing Cole's Flights we hope to see you soon!"
    redirect_to flight_path(@f.id)
  rescue ActiveRecord::RecordNotUnique
    flash[:error] = "Error! You cannot book a flight twice!"
    redirect_to flights_path
  end

  def destroy
    get_user_and_flight
    if @p.nil?
      flash[:error] = "Error invalid session"
      redirect_to flights_path
    end

    @p.flights.delete(@f)
    flash[:success] = "Flight successfully deleted"
    redirect_to flights_path
  end

  private

  def get_user_and_flight
    @p = Passenger.find_by(id: session[:passenger_id])
    @f = Flight.find(params[:flight_id])
  end
end
