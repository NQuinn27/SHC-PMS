Rails.application.routes.draw do
  resources :patients
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    confirmations:  'users/confirmations',
    passwords:  'users/passwords',
    unlocks: 'users/unlocks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

end
