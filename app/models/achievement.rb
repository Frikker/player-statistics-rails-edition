class Achievement < ApplicationRecord
  has_many :player_statistics

  validates_presence_of :name, :countable

  scope :name, ->(name) { where("name IS #{name}") }
end
