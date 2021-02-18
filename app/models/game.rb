class Game < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many_attached :photos

  validates :name, :description, :category, :price, presence: true
end
