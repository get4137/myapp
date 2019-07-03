# frozen_string_literal: true

class Answer < ApplicationRecord

  belongs_to :checklist
  belongs_to :question

  validates :value, presence: true
  validates :comment, presence: true, length: { minimum: 12 }, unless: :value_is_none?

  def value_is_none?
    value == "none"
  end

end