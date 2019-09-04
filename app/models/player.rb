# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :player_statistics

  belongs_to :team

  validates :name, presence: true, uniqueness: true

  def add_statistic(achievement_id, team_match_id, value)
    player_statistics.create(player: self, achievement: Achievement.find(achievement_id),
                             team_match: TeamMatch.find(team_match_id), value: value)
  end

  def check_players_achievements(achievement_id, value)
    player_statistics.where(player: self, achievement: achievement_id)
                                 .where("value > ?", value)
  end
end
