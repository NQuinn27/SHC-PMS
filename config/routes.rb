Rails.application.routes.draw do
  resources :icd10s
  resources :patients
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    confirmations:  'users/confirmations',
    passwords:  'users/passwords',
    unlocks: 'users/unlocks',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'patients#index'

end
