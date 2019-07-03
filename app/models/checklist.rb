class Checklist < ApplicationRecord

  has_many :answers, inverse_of: :checklist, dependent: :destroy
  belongs_to :user
  belongs_to :form

  validates :project_uid, presence: true

  accepts_nested_attributes_for :answers, allow_destroy: true

  resourcify

end