class Game < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :name, :description, :category, presence: true
end
