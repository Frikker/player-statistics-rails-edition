class TeamMatch < ApplicationRecord
  has_many :player_statistics

  belongs_to :team

  before_validation do
    self.name = "#{team.name} vs. #{Team.find(opponent).name}.|
                 |#{date}"
  end
end
