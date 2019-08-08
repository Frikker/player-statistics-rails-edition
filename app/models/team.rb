# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :players
  has_many :team_matches

  validates :name, uniqueness: true, presence: true
end
