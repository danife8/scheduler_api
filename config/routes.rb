Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :availabilities
      resources :appointments
      resources :patients
      resources :specialists
    end
  end
end
