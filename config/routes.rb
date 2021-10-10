Rails.application.routes.draw do
  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users,
              path: 'api/v1/users',
              controllers: {
                registrations: 'api/v1/users/registrations',
                sessions: 'api/v1/users/sessions'
              }

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        collection do
          resource :me, only: %i[show], controller: 'users/me'
        end
      end
    end
  end
end
