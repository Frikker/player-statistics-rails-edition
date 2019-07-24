class Player < ApplicationRecord
  has_many :player_statistics

  belongs_to :team

  validates_presence_of :name

  def check_player(achievement, value)
    PlayerStatistic.player(id).find_by(achievement: achievement).find_by(value: value)
  end
end
