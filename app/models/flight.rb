class Flight < ApplicationRecord
  has_and_belongs_to_many :passengers
  belongs_to :source_port, class_name: "Airport"
  belongs_to :dest_port, class_name: "Airport"
end
