Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :customers, only:[:index,:new,:create,:show,:edit,:update]
end
