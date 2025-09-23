class Car < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_many :users, through: :chats
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
  validates :ABS, inclusion: { in: [true, false] }
  validates :traction_control, inclusion: { in: [true, false] }
  validates :capacity, numericality: true
  validates :tank_capacity, numericality: true
  validates :consumption, numericality: true
  validates :leather_seats, inclusion: { in: [true, false] }
  validates :serial_number, presence: true
end
