# frozen_string_literal: true

class AddTables < ActiveRecord::Migration[5.2]

  def change
    create_table :forms do |t|
      t.string :title
      t.text :body
      t.string :status, default: 'draft'
      t.datetime :published_at
      t.timestamps
    end
    create_table :checklists do |t|
      t.string :project_uid
      t.references :form, foreign_key: true
      t.timestamps
    end
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.references :form, foreign_key: true
      t.timestamps
    end
    create_table :answers do |t|
      t.string :value
      t.text :comment
      t.references :checklist, foreign_key: true
      t.references :question, foreign_key: true
      t.timestamps
    end
  end

end