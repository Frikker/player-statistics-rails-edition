# frozen_string_literal: true

class TeamMatch < ApplicationRecord
  has_many :player_statistics

  belongs_to :team, foreign_key: :team_id
  belongs_to :opponent_team, class_name: 'Team', foreign_key: 'opponent_team_id'

  before_validation do
    self.name = "#{team.name} vs. #{opponent_team.name}. #{date}"
  end
end
