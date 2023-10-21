require 'sidekiq/web'

Rails.application.routes.draw do
  resources :booking_types
  resources :bookings
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  devise_for :users

  authenticated :user do
    root to: "home#dashboard", as: :authenticated_root
  root to: 'home#index'
end

  get "up" => "rails/health#show", as: :rails_health_check
end
