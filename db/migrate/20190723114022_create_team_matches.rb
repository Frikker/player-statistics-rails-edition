class CreateTeamMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :team_matches do |t|
      t.text :name, null: false
      t.date :date, null: false
      t.integer :opponent_team_id, null: false
      t.integer :team_id, null: false
      t.timestamps
    end
    add_index :team_matches, %i[opponent_team_id team_id]
  end
end
