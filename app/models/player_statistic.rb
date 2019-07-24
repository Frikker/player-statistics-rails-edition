class PlayerStatistic < ApplicationRecord
  belongs_to :achievement
  belongs_to :player
  belongs_to :team_match

  validates_presence_of :value, :achieved

  scope :player, ->(player) { find(player) }
end
