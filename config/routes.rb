Rails.application.routes.draw do
  get 'search/index'

  get 'books/show'
  post 'review/create' => 'review#create'
  get 'home/index'
  get 'search' => 'search#search'
  root :to => 'home#index'

  
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
