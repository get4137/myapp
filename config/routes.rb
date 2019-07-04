# frozen_string_literal: true

Rails.application.routes.draw do

  get 'checklists/new'
  devise_for :users
  root 'users#profile'
  get 'forms/publish'
  resources :forms
  resources :checklists
end