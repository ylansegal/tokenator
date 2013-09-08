Tokenator::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :tokens

  root :to => "home#index"
end