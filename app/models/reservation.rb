class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :status, :total, presence: true
end
