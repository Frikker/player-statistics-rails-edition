# frozen_string_literal: true

class PlayerStatistic < ApplicationRecord
  belongs_to :achievement
  belongs_to :player
  belongs_to :team_match

  scope :top_five_team, ->(team) {
    where(player: Player.where(team: Team.find(team)).take(1000)) unless team.zero?
  }
end
