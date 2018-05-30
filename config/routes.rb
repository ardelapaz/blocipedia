Rails.application.routes.draw do
  resources :wikis

  devise_for :users, controllers: { registrations: "registrations" }

  root 'welcome#index'
  get 'about' => 'welcome#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
