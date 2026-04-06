class AddUserIdToMoods < ActiveRecord::Migration[7.2]
  def change
    add_reference :moods, :user, null: false, foreign_key: true
  end
end
