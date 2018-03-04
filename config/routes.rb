Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :articles do 
  	post :add_like, on: :member
  	
  	resources :comments, only: [:create, :destroy]
  end
end
