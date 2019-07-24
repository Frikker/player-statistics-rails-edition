class Team < ApplicationRecord
  has_many :players
  has_many :team_matches

  validates :name, uniqueness: true, presence: true
end
