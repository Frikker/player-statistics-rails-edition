class Achievement < ApplicationRecord
  has_many :player_statistics

  validates_presence_of :name, :countable

  def top(limit = 5)
    list = PlayerStatistic.where(achievement: self).order(value: :desc).take(limit)
    list.each do |player|
      puts "#{player.player.name}: #{player.value}"
    end
  end
end
