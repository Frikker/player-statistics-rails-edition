class TeamMatch < ApplicationRecord
  has_many :player_statistics

  belongs_to :team

  validates_associated :team
  validates_presence_of :name, :date, :opponent

  before_save do
    name = "#{teams_id} vs. #{Team.first(opponent)}. #{date}"
  end
end
