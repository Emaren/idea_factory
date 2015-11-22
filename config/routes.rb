Rails.application.routes.draw do

  devise_for :users
  root 'ideas#index'

  resources :ideas do
    resources :comments
  end
  



end
