class PlayerStatistic < ApplicationRecord
  belongs_to :achievement
  belongs_to :player
  belongs_to :team_match

  validates_associated :achievement, :player, :team_match
  validates_presence_of :value, :achieved
end
