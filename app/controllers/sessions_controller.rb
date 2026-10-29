class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [ :new, :create ]

  def new
  end

  def create
    p = get_passenger

    if (session[:passenger_id] == p&.id) && !(p.nil?)
      flash[:success] = "Already logged in"
      redirect_to flights_path
    elsif p&.authenticate(params[:password])
      session[:passenger_id] = p.id
      flash[:success] = "Welcome back #{p.username}"
      redirect_to flights_path
    else
      flash.now[:error] = "Error: Wrong password, username or email"
      render :new, status: :unauthorized
    end
  end

  def destroy
    session.delete :passenger_id
    flash[:success] = "Successfully Logged Off"
    redirect_to flights_path
  end

  private

  def get_passenger
    p = Passenger.find_by(username: params[:username])
    if p.nil?
      p = Passenger.find_by(email: params[:email])
    end
    p
  end
end
