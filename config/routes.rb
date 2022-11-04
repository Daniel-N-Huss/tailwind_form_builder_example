Rails.application.routes.draw do
  resources :adventurers, only: %i[index show update]

  root "adventurers#index"
end
