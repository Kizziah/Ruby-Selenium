WarhammerBuilder::Application.routes.draw do



  resources :armies do
    resources :squads
  end

  devise_for :users
  root to: 'armies#index'


end

