class Team < ApplicationRecord
  has_many :players
  has_and_belongs_to_many :team_matches

  validates :name, uniqueness: true, presence: true
end
