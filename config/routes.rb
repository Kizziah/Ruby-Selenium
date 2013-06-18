WarhammerBuilder::Application.routes.draw do

  get "armies/new_blood" => "armies#new_blood"
  get "armies/new_wolf" => "armies#new_wolf"


  resources :armies do
    resources :squads
  end

  resources :squads, only: [] do
    resources :troops
  end

  devise_for :users
  root to: 'armies#index'

end

