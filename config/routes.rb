Rails.application.routes.draw do
  resources :wikis do 
    resources :collaborators, only: [:new, :create, :destroy]
  end
  resources :charges, only: [:new, :create]

  devise_for :users, controllers: { registrations: "registrations" } 
  resources :users do
      put :demote
  end

  root 'welcome#index'
  get 'about' => 'welcome#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
