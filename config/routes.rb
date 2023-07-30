Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'customer/sessions',
    registrations: 'customer/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  root to: 'pages#home'
  namespace :admin do
    resources :products, only: %i[index show new create edit update]
  end

  get '/up/', to: 'up#index', as: :up
  get '/up/databases', to: 'up#databases', as: :up_databases
end
