class User < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_many :cars, through: :chats
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
