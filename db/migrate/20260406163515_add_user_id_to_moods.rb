class AddUserIdToMoods < ActiveRecord::Migration[7.2]
  def change
    add_reference :moods, :user, foreign_key: true
  end
end