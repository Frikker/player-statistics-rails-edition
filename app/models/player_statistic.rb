# frozen_string_literal: true

class PlayerStatistic < ApplicationRecord
  belongs_to :achievement
  belongs_to :player
  belongs_to :team_match

  validates :value, presence: true

  scope :top_players_in_team, ->(team) {
    joins(player: :team).where(teams: {id: team}) unless team.zero?
  }
end
