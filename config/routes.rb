Rails.application.routes.draw do
  devise_for :users
  root to: 'subscriptions#index'
    resources :subscriptions, only: [:index]
end
