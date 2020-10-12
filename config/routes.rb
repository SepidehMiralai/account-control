Rails.application.routes.draw do
  devise_for :legal_people, path: 'legal_people', controllers: { sessions: "legal_people/sessions", registrations: "legal_people/registrations"}
  devise_for :people, path: 'people', controllers: { sessions: "people/sessions", registrations: "people/registrations"}
  resources :accounts
  root to: 'accounts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
