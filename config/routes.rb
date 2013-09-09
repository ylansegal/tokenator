Tokenator::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :tokens, :except => [:show]

  root :to => "home#index"
end