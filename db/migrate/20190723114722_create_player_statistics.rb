class CreatePlayerStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :player_statistics do |t|
      t.integer :value
      t.boolean :achieved

      t.references :achievement, foreign_key: true
      t.references :player, foreign_key: true
      t.references :team_match, foreign_key: true
      t.timestamps
    end
  end
end
