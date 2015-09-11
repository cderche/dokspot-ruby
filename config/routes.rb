Rails.application.routes.draw do

  get 'service', to: 'visitors#service'
  get 'about', to: 'visitors#about'
  get 'demo', to: 'visitors#demo'
  get 'terms', to: 'visitors#terms'
  get 'business', to: 'visitors#business'
  get 'promise', to: 'visitors#promise'
  get 'privacy', to: 'visitors#privacy'
  
  get 'qrcode/show'

  devise_for :users, skip: :registrations
  resources :users do
    get :promote
    get :demote
  end

  resources :companies do
    resources :products, except: :index, shallow: true
  end
  
  resources :products, path: '', except: [:index, :new, :create] do
    resources :instructions, shallow: true
    resources :notifications, shallow: true, except: :show
    get :download_qrcode
  end
  
  #resources :instructions, only: [:show, :edit, :destroy]
  #except: [:new, :index]
  
  resources :instructions, except: [:index, :new, :create] do
    resources :documents, except: :show, shallow: true
		resources :orders, shallow: true
    get :primary
  end
  
  resources :documents, except: :show do
    get :download
  end

  root to: 'visitors#index'
  
  post :search, to: "visitors#search"
  
  post "/about"     => "customers#contact"    , :as => :contact
  post "/callback"  => "customers#callback"   , :as => :callback
  get "customers/close/:id"  => "customers#close"   , :as => :close
  
end