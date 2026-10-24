class PassengerProfile < ApplicationRecord
  validates :dob, presence: true
  validates :ssn, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true

  belongs_to :passenger
end
