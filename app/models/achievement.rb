# frozen_string_literal: true

class Achievement < ApplicationRecord
  has_many :player_statistics

  validates :name, presence: true, uniqueness: true

  def top_players(limit = 5, team_id = 0)
    PlayerStatistic.top_players_in_team(team_id).where(achievement: self)
                   .order(value: :desc).group(:player_id)
                   .take(limit)
  end
end
