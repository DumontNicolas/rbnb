class Review < ApplicationRecord
  belongs_to :reservation
  belongs_to :user

  validates :content, :rating, presence: true
end
