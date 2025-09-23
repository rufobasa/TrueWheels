class Message < ApplicationRecord
  belongs_to :chat
  validates :role, presence: true, inclusion: { in: ["user", "assistant"] }
  validates :content, presence: true
end
