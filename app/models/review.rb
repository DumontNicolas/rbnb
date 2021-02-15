class Review < ApplicationRecord
  belongs_to :reservation
  belongs_to :user

  validates :content, :role, :rating, presence: true
end
