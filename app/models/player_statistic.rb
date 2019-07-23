class PlayerStatistic < ApplicationRecord
  belongs_to :achievement
  belongs_to :player
  belongs_to :team_match
end
