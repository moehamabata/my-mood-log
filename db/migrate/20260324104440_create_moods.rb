class CreateMoods < ActiveRecord::Migration[7.2]
  def change
    create_table :moods do |t|
      t.string :feeling
      t.text :note

      t.timestamps
    end
  end
end
