class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :car
  has_many :messages
  validates :title, presence: true, uniqueness: { scope: [:user_id, :car_id] }

end

