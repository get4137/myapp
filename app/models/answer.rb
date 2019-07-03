# frozen_string_literal: true

class Answer < ApplicationRecord

  belongs_to :checklist
  belongs_to :question

  validates :value, presence: true
  validates :comment, presence: true, length: { minimum: 12 }, unless: :values_is_none?

  def values_is_none?
    value == "none"
  end

end