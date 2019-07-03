# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/profile'
  get 'checklists/new'
  devise_for :users
  root 'forms#index'
  resources :forms
  resources :checklists
end