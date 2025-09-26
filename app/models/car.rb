class Car < ApplicationRecord
  has_many :users
  validates :brand, presence: true
  validates :car_model, presence: true
  validates :version, presence: true
  validates :year, presence: true, numericality: { less_than: 2025 }
  validates :miles, presence: true, numericality: true
  validates :color, presence: true
  validates :doors, presence: true
  validates :fuel_type, presence: true, inclusion: { in: ["electric", "hybrid", "gasoil", "oil"] }
  validates :transmission, presence: true, inclusion: { in: ["MT", "AT"] }
  validates :displacement, presence: true, numericality: true
  validates :horse_power, numericality: true
  validates :torque, numericality: true
  validates :acceleration, numericality: true
  validates :autonomy, numericality: true
  validates :airbags, numericality: true
  validates :ABS, presence: true
  validates :traction_control, presence: true
  validates :capacity, numericality: true
  validates :tank_capacity, numericality: true
  validates :consumption, numericality: true
  validates :leather_seats, presence: true
  validates :serial_number, presence: true
end
