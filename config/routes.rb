Rails.application.routes.draw do
  get 'books/index',to:"books#index"
  get 'review/index',to:"review#index"
  get 'follow/:id',to: "follow#index"
  post "follow/:follow_id", to:"follow#create"
  get 'users/show/:id' => 'users#show', as: "users_show"
  get 'search/index'
  get 'books/show'
  post 'review/create' => 'review#create'
  get 'home/index'
  get 'search' => 'search#search'
  root :to => 'home#index'
  get "timeline",to:"timeline#index"
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      "users/show" => "users#show"
    }
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
