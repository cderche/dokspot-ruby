Rails.application.routes.draw do

  devise_for :users, skip: :registrations
  resources :users do
    get :promote
    get :demote
  end

  resources :companies do
    resources :products, except: :index, shallow: true
  end
  
  resources :products, except: [:index, :new, :create] do
    resources :instructions, shallow: true
    resources :notifications, shallow: true, except: :show
  end
  
  #resources :instructions, only: [:show, :edit, :destroy]
  #except: [:new, :index]
  
  resources :instructions, except: [:index, :new, :create] do
    resources :documents, except: :show, shallow: true
    get :primary
  end
  
  resources :documents, except: :show do
    get :download
  end

  root to: 'visitors#index'
  
  get :search, to: "visitors#search"
  
end
