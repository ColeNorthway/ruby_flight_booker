class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  protected
  # Prehandlers for authorization
  before_action :authenticate
  before_action :auth_state

  def authenticate
    unless logged_in?
      flash[:error] = "Error you need to be signed in to view that"
      redirect_to flights_path
    end
  end

  def auth_state
    @logged_in = logged_in? ? true : false
  end

  def logged_in?
    return false if session[:passenger_id].nil?

    p = Passenger.find_by(id: session[:passenger_id])
    return false if p.nil?

    true
  end
end
