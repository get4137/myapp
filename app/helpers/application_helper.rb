# frozen_string_literal: true

module ApplicationHelper
  def has_role?(role)
    current_user&.has_role?(role)
  end
end
