class AddMoodToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :mood, :string
  end
end
