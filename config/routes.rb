Rails.application.routes.draw do
  get 'wikis/index'

  get 'wikis/show'

  get 'wikis/new'

  get 'wikis/edit'

  get 'wikis/create'

  get 'wikis/update'

  devise_for :users, controllers: { registrations: "registrations" }
  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
