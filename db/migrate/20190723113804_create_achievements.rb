class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.text :name, null: false

      t.timestamps
    end
  end
end
