Rails.application.routes.draw do

  devise_for :users, skip: :registrations
  resources :users

  resources :companies do
    resources :products, except: :index, shallow: true
  end
  
  resources :products, except: [:index, :new, :create] do
    resources :instructions, shallow: true
    resources :notifications, shallow: true
  end
  
  resources :instructions, only: [:show, :edit, :destroy] do
    resources :documents, except: :show, shallow: true
    get :primary
  end
  
  resources :documents, except: :show do
    get :download
  end

  root to: 'visitors#index'
  
end
