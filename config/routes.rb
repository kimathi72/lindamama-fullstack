Rails.application.routes.draw do
  resources :results, only: [:index]
  resources :appointments
  resources :doctors, only: [:index, :show]
  resources :patients, only: [:index, :show, :create, :destroy]
  resources :departments, only: [:index]
  resources :diet_questions
  resources :diet_blogs

  post '/doclogin', to: 'sessions#doclogin'
  post '/patientlogin', to: 'sessions#patientlogin'
  delete '/logout', to: 'sessions#logout'
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
