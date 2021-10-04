class Team < ApplicationRecord
  validates :members, :size, presence: true
  validates :size, numericality: { greater_than_or_equal_to: 10, less_than: 31 }
end
