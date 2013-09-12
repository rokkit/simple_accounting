SimpleAccounting::Application.routes.draw do
  resources :http_requests

  resources :bank_books, shallow: true do 
    resources :operations
  end

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :activities
  get 'home/geo'
end
