Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :agencies, only: [:index, :show] do
    resources :routes, only: [:index, :show] do
      resources :trips, only: [:index, :show]
    end
  end

  resources :stops, only: [:index, :show]
  resources :calendar_dates, only: [:index, :show]
  resources :stop_times, only: [:index, :show]
end
