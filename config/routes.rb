WarhammerBuilder::Application.routes.draw do

  devise_for :users
  root to: 'armies#index'

  get "armies/new_blood" => "armies#new_blood"
  get "armies/new_wolf" => "armies#new_wolf"
  get "armies/new_ork" => "armies#new_ork"
  get "armies/new_ultra" => "armies#new_ultra"
  get "armies/new_dark" => "armies#new_dark"
  match '/dashboard' => 'users#dashboard'

  resources :armies do
    resources :squads
  end

  resources :squads, only: [] do
    resources :troops
  end



end

