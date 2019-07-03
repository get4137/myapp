# frozen_string_literal: true

class Form < ApplicationRecord

  has_many :questions, inverse_of: :form, dependent: :destroy
  has_many :checklists, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :status, presence: true

  accepts_nested_attributes_for :questions, allow_destroy: true

  PUBLISHED_OPTIONS = { draft: 'Draft', published: 'Published' }.freeze

end