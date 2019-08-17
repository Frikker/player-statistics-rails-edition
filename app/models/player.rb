# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :player_statistics

  belongs_to :team

  validates :name, presence: true, uniqueness: true

  def add_statistic(achievement_id, team_match_id, value)
    PlayerStatistic.create(player: self, achievement: Achievement.find(achievement_id),
                           team_match: TeamMatch.find(team_match_id), value: value)
  end

  def check_player(achievement_id, value)
    statistic = PlayerStatistic.where(player: self, achievement: achievement_id)
                               .where("value > #{value}").find_each
    "#{name} reached #{value} at '#{Achievement.find(achievement).name}' #{statistic.count} times"
  end
end
