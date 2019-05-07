Rails.application.routes.draw do
  get 'search/index'

  get 'books/show'

  get 'home/index'
  post 'search' => 'search#search'
  root :to => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
