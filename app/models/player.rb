class Player < ApplicationRecord
  has_many :player_statistics

  belongs_to :team

  validates_associated :team
  validates_presence_of :name
  
  def add_statistic(achievement, team_match, value)
    PlayerStatistic.create(player: self, achievement: Achievement.find(achievement),
                           team_match: TeamMatch.find(team_match), value: value)
  end

  def check_player(achievement, value)
    statistic = PlayerStatistic.where(player: self, achievement: achievement)
                               .where("value > #{value}").find_each
    "#{name} reached #{value} at '#{Achievement.find(achievement).name}' #{statistic.count} times"
  end
end
