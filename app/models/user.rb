class User < ApplicationRecord
  has_many :games
  has_many :reviews
  has_many :reservations

  validates :first_name, :last_name, :email, :location, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
