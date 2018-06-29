Rails.application.routes.draw do
  root to: 'searches#index'

  # remove 'searches/' from url since it's our only route
  resources :searches, path: '', only: %w(index create)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
