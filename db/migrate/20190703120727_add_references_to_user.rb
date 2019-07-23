# frozen_string_literal: true

class AddReferencesToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :checklists, :user, foreign_key: true
  end
end
