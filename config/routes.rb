Rails.application.routes.draw do
  root 'home#index'

  get 'search' => 'search#search'
  
  get 'books/index',to:"books#index"
  get 'books/show/:identifier',to:"books#show", as:"books_show"
  
  get 'follow/:id',to: "follow#index"
  post "follow/:follow_id", to:"follow#create"
  
  get 'users/show/:id' => 'users#show', as: "users_show"

  get "timeline",to:"timeline#index"
  
  get 'review/index',to:"review#index"
  post 'review/create' => 'review#create'
  put 'review/update' => "review#update"
  
  post "profile_link/create" => "profile_link#create"
  put  "profile_link/update" => "profile_link#update"
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      confirmations:'users/confirmations',
      passwords:"users/passwords",
      mailer: 'users/mailer',
      "users/show" => "users#show",
    }
  namespace "api" do
    namespace "v1" do
      scope "books" do
        get "/latest/:count", to: "books#latest"
      end
      namespace "review" do
        get "/latest/:count", to: "#latest"
      end
	  end
  end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
