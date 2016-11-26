Rails.application.routes.draw do
  resources :agencies, only: [:index, :show] do
    resources :routes, only: :index
  end

  resources :routes, only: [:index, :show] do
    resources :trips, only: :index
  end

  resources :trips, only: [:index, :show] do
    resources :stops, only: :index
    resources :stop_times, only: :index
  end

  resources :stops, only: [:index, :show] do
    resources :stop_times, only: :index
    resources :trips, only: :index
  end

  resources :calendar_dates, only: [:index, :show]
end
