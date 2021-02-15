class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :total, presence: true
end
