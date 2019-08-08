class CreatePlayerStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :player_statistics do |t|
      t.integer :value, null: false

      t.integer :achievement_id, null: false
      t.integer :player_id, null: false
      t.integer :team_match_id, null: false
      t.timestamps
    end
    add_index :player_statistics,
              %i[achievement_id player_id team_match_id],
              name: 'index_player_statistics_achievement_player_team_match'
  end
end
