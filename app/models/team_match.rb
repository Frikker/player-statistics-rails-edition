class TeamMatch < ApplicationRecord


  has_many :player_statistics

  belongs_to :team

  validates_associated :team
  validates_presence_of :name, :date, :opponent

  before_validation do |match|
    self.name = "#{match.team.name} vs. #{Team.find(match.opponent).name}.|
                 |#{match.date}"
  end
end
