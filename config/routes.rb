Rails.application.routes.draw do
  
  devise_for :legal_people, path: 'legal_people', controllers: { sessions: "legal_people/sessions", registrations: "legal_people/registrations"} 
  shallow do 
    resources :legal_people do
      resources :accounts do 
        resources :account_transactions
      end
    end
  end
  
  devise_for :people, path: 'people', controllers: { sessions: "people/sessions", registrations: "people/registrations"} 
  shallow do
    resources :people do
      resources :accounts do
        resources :account_transactions
      end
    end 
  end
  
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
