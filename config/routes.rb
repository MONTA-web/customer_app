Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :customers do
    collection do
      get :search
      get :aggregate_result
      get :aggregate_search
    end
  end 
end
