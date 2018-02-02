Rails.application.routes.draw do
  root to: "pages#home"
  resources :bases, only: [:index]
end
