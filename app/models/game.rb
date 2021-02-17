class Game < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :photo

  validates :name, :description, :category, :price, presence: true
end
