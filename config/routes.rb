Rails.application.routes.draw do

  resources :companies do
    resources :products, except: :index, shallow: true
  end
  
  resources :products, except: :index do
    resources :instructions, shallow: true
    resources :notifications, shallow: true
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
