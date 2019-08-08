class TeamMatch < ApplicationRecord
  has_many :player_statistics

  belongs_to :team, foreign_key: 'opponent'

  validates_associated :team
  validates_presence_of :name, :date, :opponent

  before_validation do
    self.name = "#{team.name} vs. #{Team.find(opponent).name}.|
                 |#{date}"
  end
end
