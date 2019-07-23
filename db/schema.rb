# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_703_120_727) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'answers', force: :cascade do |t|
    t.string 'value'
    t.text 'comment'
    t.bigint 'checklist_id'
    t.bigint 'question_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['checklist_id'], name: 'index_answers_on_checklist_id'
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'checklists', force: :cascade do |t|
    t.string 'project_uid'
    t.bigint 'form_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.index ['form_id'], name: 'index_checklists_on_form_id'
    t.index ['user_id'], name: 'index_checklists_on_user_id'
  end

  create_table 'forms', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.string 'status', default: 'draft'
    t.datetime 'published_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'questions', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.bigint 'form_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['form_id'], name: 'index_questions_on_form_id'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[name resource_type resource_id], name: 'index_roles_on_name_and_resource_type_and_resource_id'
    t.index %w[resource_type resource_id], name: 'index_roles_on_resource_type_and_resource_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'role_id'
    t.index ['role_id'], name: 'index_users_roles_on_role_id'
    t.index %w[user_id role_id], name: 'index_users_roles_on_user_id_and_role_id'
    t.index ['user_id'], name: 'index_users_roles_on_user_id'
  end

  add_foreign_key 'answers', 'checklists'
  add_foreign_key 'answers', 'questions'
  add_foreign_key 'checklists', 'forms'
  add_foreign_key 'checklists', 'users'
  add_foreign_key 'questions', 'forms'
end
