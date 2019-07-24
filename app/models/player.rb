class Player < ApplicationRecord
  has_many :player_statistics

  belongs_to :team

  validates_associated :team
  validates_presence_of :name

  def check_player(achievement, value)
    statistic = PlayerStatistic.where(player: self, achievement: achievement)
                    .where("value > #{value}").find_each
    "#{name} reached #{value} at '#{Achievement.find(achievement).name}' #{statistic.count} times"
  end
end
