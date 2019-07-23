# frozen_string_literal: true

Rails.application.routes.draw do
  get 'checklists/new'
  get 'forms/publish'
  get 'users/profile'
  devise_for :users
  root 'checklists#index'
  resources :forms
  resources :checklists
end
