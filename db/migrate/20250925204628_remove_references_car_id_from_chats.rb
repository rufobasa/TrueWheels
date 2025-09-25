class RemoveReferencesCarIdFromChats < ActiveRecord::Migration[7.1]
  def change
    remove_reference :chats, :car, null: false, foreign_key: true
  end
end
