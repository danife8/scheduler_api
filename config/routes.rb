Rails.application.routes.draw do
  defaults format: :json do
    match '/404', to: 'errors#not_found', via: :all
    match '/500', to: 'errors#internal_server_error', via: :all

    namespace :api do
      namespace :v1 do
        resources :appointments
        resources :patients
        resources :specialists do
          resources :availabilities
        end
      end
    end
  end
end
