class PassengerProfile < ApplicationRecord
  validates :dob, presence: true
  validates :ssn, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true

  belongs_to :passenger

  before_save do |profile|
    p "SSN: #{profile.ssn}"
    profile.ssn = BCrypt::Password.create(profile.ssn) unless profile.ssn.nil?
  end
end
