Rails.application.routes.draw do
  resources :practices, :except => [:edit, :new]
end
