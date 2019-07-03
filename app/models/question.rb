# frozen_string_literal: true

class Question < ApplicationRecord

  has_many :answers, dependent: :destroy
  belongs_to :form

  validates :title, presence: true
  validates :body, presence: true

  ANSWER_OPTIONS = { none: 'None', na: 'N/A', yes: 'Yes', no: 'No' }.freeze

end