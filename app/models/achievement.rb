# frozen_string_literal: true

class Achievement < ApplicationRecord
  has_many :player_statistics

  validates :name, presence: true, uniqueness: true

  def top(limit = 5, team_id = 0)
    list = PlayerStatistic.where(achievement: self)
                          .top_five_team(team_id)
                          .order(value: :desc).take(limit)
    list.each do |player|
      puts "#{player.player.name}: #{player.value}"
    end
  end
end
