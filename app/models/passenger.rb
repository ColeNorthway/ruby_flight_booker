class Passenger < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validate :password_complexity

  validates_associated :passenger_profile, uniqueness: true, required: true
  validates_associated :flights

  has_one :passenger_profile, dependent: :destroy, required: true
  has_and_belongs_to_many :flights

  private

  def password_complexity
    if password.present? and !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{12,}$/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, one digit, and needs to be minimum 12 characters."
    end
  end
end
