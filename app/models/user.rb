class User < ApplicationRecord

  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :checklists, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true, length: {minimum: 6}

end
