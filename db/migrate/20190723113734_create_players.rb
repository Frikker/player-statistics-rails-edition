class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.text :name
      t.references :teams, foreign_key: true
      t.timestamps
    end
  end
end
