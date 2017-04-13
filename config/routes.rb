Rails.application.routes.draw do
  resources :appointments
  resources :patient_conditions
  resources :doctors
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

  get '/patient_condition/:id/cure', to: 'patient_conditions#cure'
  get '/reports', to: 'reports#index'

  root 'patients#index'

end
