Rails.application.routes.draw do
  root 'welcome#index'

  resources :articles do 
  	resources :comments, only: [:create, :destroy]
  end
end
