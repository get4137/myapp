class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :checklists, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true, length: {minimum: 6}

end
