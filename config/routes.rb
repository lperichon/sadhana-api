Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions" }
  resources :practices, :except => [:edit, :new]
  resources :techniques, :only => [:index]
end
