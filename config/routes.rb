SimpleAccounting::Application.routes.draw do
  resources :bank_books

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :activities
end
