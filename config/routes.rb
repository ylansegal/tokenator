Tokenator::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :tokens, :except => [:index]
end