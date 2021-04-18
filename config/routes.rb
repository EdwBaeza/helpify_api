Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users,
              path: 'api/users',
              controllers: {
                registrations: 'api/users/registrations',
                sessions: 'api/users/sessions'
              }

  # namespace :api do
  #   resources :users, only: [] do
  #   end
  # end
end
