Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users,
              path: 'api/v1/users',
              controllers: {
                registrations: 'api/v1/users/registrations',
                sessions: 'api/v1/users/sessions'
              }

  # namespace :api do
  #   resources :users, only: [] do
  #   end
  # end
end
