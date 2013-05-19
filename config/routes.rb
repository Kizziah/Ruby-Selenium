WarhammerBuilder::Application.routes.draw do

  resources :armies do
    resources :squads
  end

  resources :squads, only: [] do
    resources :troops
  end

  devise_for :users
  root to: 'armies#index'

end

