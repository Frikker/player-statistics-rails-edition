class CreateTeamMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :team_matches do |t|
      t.text :name
      t.date :date
      t.integer :opponent
      t.references :team, foreign_key: true
      t.timestamps
    end
  end
end
